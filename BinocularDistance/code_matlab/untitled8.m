% Auto-generated by stereoCalibrator app on 19-May-2022
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'D:\Job\毕业设计\TestStadiometry\image\Left1.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left10.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left11.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left12.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left13.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left14.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left15.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left16.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left17.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left18.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left19.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left2.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left20.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left21.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left22.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left23.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left24.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left25.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left26.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left27.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left28.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left29.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left3.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left30.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left31.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left32.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left33.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left34.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left35.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left36.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left37.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left38.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left39.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left4.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left40.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left5.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left6.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left7.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left8.bmp',...
    'D:\Job\毕业设计\TestStadiometry\left\Left9.bmp',...
    };
imageFileNames2 = {'D:\Job\毕业设计\TestStadiometry\image\Right1.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right10.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right11.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right12.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right13.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right14.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right15.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right16.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right17.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right18.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right19.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right2.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right20.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right21.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right22.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right23.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right24.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right25.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right26.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right27.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right28.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right29.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right3.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right30.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right31.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right32.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right33.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right34.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right35.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right36.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right37.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right38.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right39.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right4.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right40.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right5.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right6.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right7.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right8.bmp',...
    'D:\Job\毕业设计\TestStadiometry\right\Right9.bmp',...
    };

% Detect calibration pattern in images
detector = vision.calibration.stereo.CheckerboardDetector();
[imagePoints, imagesUsed] = detectPatternPoints(detector, imageFileNames1, imageFileNames2);

% Generate world coordinates for the planar patten keypoints
squareSize = 2.850000e+01;  % in units of 'millimeters'
worldPoints = generateWorldPoints(detector, 'SquareSize', squareSize);

% Read one of the images from the first stereo pair
I1 = imread(imageFileNames1{1});
[mrows, ncols, ~] = size(I1);

% Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', true, 'EstimateTangentialDistortion', true, ...
    'NumRadialDistortionCoefficients', 3, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(stereoParams);

% Visualize pattern locations
h2=figure; showExtrinsics(stereoParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, stereoParams);

% You can use the calibration data to rectify stereo images.
I2 = imread(imageFileNames2{1});
[J1, J2, reprojectionMatrix] = rectifyStereoImages(I1, I2, stereoParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('StereoCalibrationAndSceneReconstructionExample')
% showdemo('DepthEstimationFromStereoVideoExample')
