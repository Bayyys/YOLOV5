# 可以运行后根据效果展示
# 如果效果极差——重新标定
# 如果效果较差——修改显示深度的窗口和调节参数的bar
# 一般情况下建议重新标定

from cv2 import cv2
import numpy as np
import camera_configs
from SGBM import SGBM


imageWidth = 640    # 分辨率宽度
imageHeight = 240   # 分辨率高度
imageSize = (imageWidth, imageHeight)


cap = cv2.VideoCapture(1, cv2.CAP_DSHOW)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, imageWidth * 2)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, imageHeight)

# 创建用于显示深度的窗口和调节参数的bar
cv2.namedWindow("depth")
# cv2.moveWindow("depth", 0, 0)
cv2.moveWindow("depth", 600, 0)


# 创建用于显示深度的窗口和调节参数的bar
# 默认状态已经调好，如需要重新调整则打开此项
# cv2.namedWindow("depth")
cv2.namedWindow("config", cv2.WINDOW_NORMAL)
# cv2.moveWindow("config", 0, 0)
cv2.moveWindow("config", 600, 0)
cv2.resizeWindow("config", 500, 500)

cv2.createTrackbar("model", "config", 0, 1, lambda x: None)
# cv2.createTrackbar("num", "config", 1, 60, lambda x: None)
# cv2.createTrackbar("PreFilterCap", "config", 31, 65,
#                    lambda x: None)  # 注意调节的时候这个值必须是奇数
# cv2.createTrackbar("BlockSize", "config", 9, 255, lambda x: None)
# cv2.createTrackbar("MinDisparity", "config", 0, 255, lambda x: None)
# cv2.createTrackbar("TextureThreshold", "config", 10, 255, lambda x: None)
# cv2.createTrackbar("UniquenessRatio", "config", 15, 255, lambda x: None)
# cv2.createTrackbar("SpeckleWindowSize", "config", 100, 500, lambda x: None)
# cv2.createTrackbar("SpeckleRange", "config", 32, 255, lambda x: None)
# cv2.createTrackbar("MaxDiff", "config", 1, 100, lambda x: None)


# 添加点击事件，打印当前点的距离
def callbackFunc(e, x, y, f, p):
    if e == cv2.EVENT_LBUTTONDOWN:
        print(threeD[y][x])
        if abs(threeD[y][x][2]) < 3000:
            print("当前距离:"+str(abs(threeD[y][x][2])))
        else:
            print("当前距离过大或请点击色块的位置")


cv2.setMouseCallback("depth", callbackFunc, None)


# 初始化计算FPS需要用到参数
# 注意不要用opencv自带fps的函数，那个函数得到的是摄像头最大的FPS
frame_rate_calc = 1
freq = cv2.getTickFrequency()
font = cv2.FONT_HERSHEY_SIMPLEX

imageCount = 1

while True:
    t1 = cv2.getTickCount()
    ret1, frame = cap.read()

    # 这里将左右两个摄像头的图像进行一下分割
    frame1 = frame[:, 0:imageWidth, :]
    frame2 = frame[:, imageWidth:imageWidth * 2, :]

    if not ret1:
        print("camera is not connected!")
        break

    ####### 深度图测量开始 ##   #####
    # 立体匹配这里使用SGBM算法，

    # 根据标定数据对图片进行重构消除图片的畸变
    img1_rectified = cv2.remap(frame1, camera_configs.left_map1, camera_configs.left_map2, cv2.INTER_LINEAR,
                               cv2.BORDER_CONSTANT)
    img2_rectified = cv2.remap(frame2, camera_configs.right_map1, camera_configs.right_map2, cv2.INTER_LINEAR,
                               cv2.BORDER_CONSTANT)

    # 如有remap()的图是反的 需要对角翻转
    # img1_rectified = cv2.flip(img1_rectified, -1)
    # img2_rectified = cv2.flip(img2_rectified, -1)

    # 将图片置为灰度图，为StereoBM作准备，BM算法只能计算单通道的图片，即灰度图
    # 单通道就是黑白的，一个像素只有一个值如[123]
    # opencv默认的是BGR(注意不是RGB)——[B,G,R]
    imgL = cv2.cvtColor(img1_rectified, cv2.COLOR_BGR2GRAY)
    imgR = cv2.cvtColor(img2_rectified, cv2.COLOR_BGR2GRAY)

    out = np.hstack((img1_rectified, img2_rectified))
    for i in range(0, out.shape[0], 30):
        cv2.line(out, (0, i), (out.shape[1], i), (0, 255, 0), 1)

    flag_model = cv2.getTrackbarPos("model", "config")

    disparity = SGBM(imgL, imgR)

    # 按照深度矩阵生产深度图
    disp = cv2.normalize(disparity, disparity, alpha=0,
                         beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)

    # 将深度图扩展至三维空间中，其z方向的值则为当前的距离
    threeD = cv2.reprojectImageTo3D(
        disparity.astype(np.float32) / 16., camera_configs.Q)
    # 将深度图转为伪色图，show
    fakeColorDepth = cv2.applyColorMap(disp, cv2.COLORMAP_JET)

    cv2.putText(frame1, "FPS: {0:.2f}".format(
        frame_rate_calc), (30, 50), font, 1, (255, 255, 0), 2, cv2.LINE_AA)

    # 按下S可以保存图片
    interrupt = cv2.waitKey(10)
    if interrupt & 0xFF == 27:  # 按下ESC退出程序
        break
    elif interrupt == ord('s'):
        cv2.imwrite('disp%d.bmp' % i, disp)
        print("Save %d image" % i)

    ####### 任务1：测距结束 #######

    # 需要对深度图进行滤波将下面几行开启即可 开启后FPS会降低
    img_medianBlur = cv2.medianBlur(disp, 25)
    img_medianBlur_fakeColorDepth = cv2.applyColorMap(
        img_medianBlur, cv2.COLORMAP_JET)
    img_GaussianBlur = cv2.GaussianBlur(disp, (7, 7), 0)
    img_Blur = cv2.blur(disp, (5, 5))
    # cv2.imshow("img_GaussianBlur", img_GaussianBlur)  # 右边原始输出
    # cv2.imshow("img_medianBlur_fakeColorDepth",
    #            img_medianBlur_fakeColorDepth)  # 右边原始输出
    # cv2.imshow("img_Blur", img_Blur)  # 右边原始输出
    # cv2.imshow("img_medianBlur", img_medianBlur)  # 右边原始输出
    # fakeColorDepth = cv2.applyColorMap(img_medianBlur, cv2.COLORMAP_JET)
    # fakeColorDepth = cv2.applyColorMap(img_Blur, cv2.COLORMAP_JET)
    # fakeColorDepth = cv2.applyColorMap(img_GaussianBlur, cv2.COLORMAP_JET)

    # 显示
    cv2.imshow("frame", np.vstack((frame, out)))  # 原始输出，用于检测左右
    cv2.imshow("depth", disp)  # 输出深度图及调整的bar
    cv2.imshow("fakeColor", fakeColorDepth)  # 输出深度图的伪色图，这个图没有用只是好看

    t2 = cv2.getTickCount()
    time1 = (t2 - t1) / freq
    frame_rate_calc = 1 / time1

cap.release()
cv2.destroyAllWindows()
