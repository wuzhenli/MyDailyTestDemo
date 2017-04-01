//
//  ViewController.m
//  defineCamera
//
//  Created by kfz on 2017/3/2.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KFZBaseCameraVC.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>
#import "KFZCameraShowView.h"



#define kKFZCameraSelColor [UIColor greenColor]

@interface KFZBaseCameraVC ()
@property (weak, nonatomic) id<KFZBaseCameraVCDelegate> delegate;


@property (strong, nonatomic) UIButton *captureButton;
@property (strong, nonatomic) UIButton *flashButton;
@property (strong, nonatomic) UIButton *closeButton;
@property (strong, nonatomic) UIButton *directionButton;
@property (strong, nonatomic) UIView *previewView;

@property (strong, nonatomic) KFZCameraShowView *cameraShowView;


/** AVFoundation */

/** session */
@property (strong, nonatomic) AVCaptureSession *session;

/// previewLayer
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;

/** device */
@property (strong, nonatomic) AVCaptureDevice *device;

/// output
@property (strong, nonatomic) AVCaptureStillImageOutput *output;


@property (assign, nonatomic) AVCaptureDevicePosition deviceposition;
@property (assign, nonatomic) AVCaptureFlashMode flashMode;

@end



@implementation KFZBaseCameraVC

- (instancetype)initWithDelegate:(id<KFZBaseCameraVCDelegate>)delegate {
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    // Do any additional setup after loading the view, typically from a nib.
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                [self initSessionConfiguration];
            } else {
                [self showTipError];
            }
        });
    }];
    
    
}

- (void)setup {
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.flashButton];
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.captureButton];
    [self.view addSubview:self.directionButton];
    
    self.previewView = [UIView new];
    self.previewView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.previewView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_session) {
        [_session startRunning];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([_session isRunning]) {
        [_session stopRunning];
    }
}


- (void)showTipError {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"应用想访问您的相机" message:@"请到-[设置]-[隐私]-[相机]-中，允许应用访问您的相机" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)initSessionConfiguration {
    //sesion
    self.session = [[AVCaptureSession alloc] init];
    if ([_session canSetSessionPreset:AVCaptureSessionPreset640x480]) {
        _session.sessionPreset = AVCaptureSessionPreset640x480;
    }
    
    // device --> input
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.device = device;
    if ( [device isFlashAvailable] && [device lockForConfiguration:nil] ) {
        self.flashMode = AVCaptureFlashModeOff;
        
        device.flashMode = self.flashMode;
        [device unlockForConfiguration];
    }
    NSError *error = nil;
    self.deviceposition = device.position;
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        return;
    }
    // output
    AVCaptureStillImageOutput *output = [AVCaptureStillImageOutput new];
    output.outputSettings = @{AVVideoCodecKey : AVVideoCodecJPEG};
    self.output = output;
    
    // add input /output
    [_session beginConfiguration];
    {
        if ([_session canAddInput:input]) {
            [_session addInput:input];
        }
        if ([_session canAddOutput:output]) {
            [_session addOutput:output];
        }
    }
    [_session commitConfiguration];
    
    // preview
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.previewLayer = previewLayer;
    
    [self.previewView.layer addSublayer:previewLayer];
    self.previewLayer.frame = self.previewView.bounds;
    
    if (self.isViewLoaded && self.view.window) {
        [_session startRunning];
    }
}



#pragma -mark
#pragma -mark 按钮的点击事件

#pragma -mark
#pragma -mark 拍照
- (void)captureButtonClicked {
    static BOOL isCaptureImage = NO;
    if (isCaptureImage) {
        return;
    }
    isCaptureImage = YES;
    
    
    AVCaptureConnection *connection = [self _currentConnection];
    
    // 设置 镜像
    if ([connection isVideoMirroringSupported]) {
        connection.videoMirrored = self.deviceposition == AVCaptureDevicePositionFront;
    }
    
    if (connection == nil) {
        return;
    }
    
    
    [_output captureStillImageAsynchronouslyFromConnection:connection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if ( isCaptureImage == NO || imageDataSampleBuffer == NULL) {
            isCaptureImage = NO;
            return ;
        }
        
        // 生成照片
        NSData *imgData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        isCaptureImage = NO;
        
        [self addTakePhotoEffect:imgData];
        
        
    }];
}

- (void)addTakePhotoEffect:(NSData *)imgData {
    UIView *flashView = [UIView new];
    flashView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.f];
    flashView.alpha = 0.f;
    [self.view addSubview:flashView];
    flashView.frame = [UIScreen mainScreen].bounds;
    
    [UIView animateWithDuration:0.15f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         flashView.alpha = 1.f;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.15f
                                               delay:0.05f
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              flashView.alpha = 0.f;
                                          }
                                          completion:^(BOOL finished2) {
                                              [flashView removeFromSuperview];
                                              // 显示预览图片
                                              [self showCaptureImage:imgData];
                                          }];
                     }];
}


#pragma -mark
#pragma -mark 切换镜头方向
- (void)directionButtonClicked:(UIButton *)sender {
    AVCaptureDevicePosition desiredPosition ;
    if (self.deviceposition == AVCaptureDevicePositionBack) {
        desiredPosition = AVCaptureDevicePositionFront;
    } else {
        desiredPosition = AVCaptureDevicePositionBack;
    }
    for (AVCaptureDevice *device in [AVCaptureDevice devices]) {
        // 1、找到制定方向的设备
        if (device.position == desiredPosition) {
            // 判断设备是否为同一个
            if (device == self.device) {
                return;
            }
            
            
            self.device = device;
            // 2、切换input
            AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
            
            
            [_session beginConfiguration];
            for (AVCaptureDeviceInput *input in _session.inputs) {
                [_session removeInput:input];
            }
            
            [_session addInput:input];
            [_session commitConfiguration];
            self.deviceposition = desiredPosition;
            // 3、判断 闪光灯状态
            if (device.flashMode == AVCaptureFlashModeOn) {
                self.flashButton.selected = YES;
            } else {
                self.flashButton.selected = NO;
            }
            
            
            break;
        }
    }
    
}



#pragma -mark
#pragma -mark 打开、关闭 闪光灯
- (void)falshButtonClicked:(UIButton *)sender {
    AVCaptureFlashMode desiredMode ;
    switch (self.flashMode) {
        case AVCaptureFlashModeOn:
        case AVCaptureFlashModeAuto:
            desiredMode = AVCaptureFlashModeOff;
            break;
        case AVCaptureFlashModeOff:
            desiredMode = AVCaptureFlashModeOn;
            break;
    }
    
    AVCaptureDevice *device = [self _currentDevice];
    if ([device isFlashModeSupported:desiredMode] && [device lockForConfiguration:nil]  ) {
        device.flashMode = desiredMode;
        self.flashMode = desiredMode;
        [device unlockForConfiguration];
        if (desiredMode == AVCaptureFlashModeOff) {
            sender.selected = NO;
        } else {
            sender.selected = YES;
        }
    }
}




- (AVCaptureDevice *)_currentDevice {
    if (_session == nil) {
        return nil;
    }
    AVCaptureDeviceInput *input = [self.session.inputs lastObject];
    return input.device;
}
/**
 * 获取当前的 connection
 */
- (AVCaptureConnection *)_currentConnection {
    AVCaptureConnection *connection = nil;
    
    for (AVCaptureConnection *con in [self.output connections]) {
        for (AVCaptureInputPort *port in con.inputPorts) {
            if ([port.mediaType isEqualToString:AVMediaTypeVideo]) {
                connection = con;
                break;
            }
        }
        
        if (connection) {
            break;
        }
    }
    return connection;
}


#pragma -mark
#pragma -mark 点击 “X”按钮，关闭拍照界面
- (void)closeButtonClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma -mark
#pragma -mark 显示拍照预览图
- (void)showCaptureImage:(NSData *)imgData {
    self.cameraShowView.imageData = imgData;
    self.cameraShowView.hidden = NO;
    [self.view bringSubviewToFront:self.cameraShowView];
    [_session stopRunning];
}


#pragma -mark
#pragma -mark UI
- (UIButton *)captureButton {
    if (!_captureButton) {
        _captureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _captureButton.backgroundColor = [UIColor clearColor];
        UIImage *image_h = [[UIImage imageNamed:@"cameraTrigger_highilight"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *image = [[UIImage imageNamed:@"cameraTrigger"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [_captureButton setImage:image forState:UIControlStateNormal];
        [_captureButton setImage:image_h forState:UIControlStateHighlighted];
        
        [_captureButton addTarget:self action:@selector(captureButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _captureButton.layer.cornerRadius = 40;
        _captureButton.layer.masksToBounds = YES;
    }
    return _captureButton;
}

- (UIButton *)flashButton {
    if (!_flashButton) {
        _flashButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [[UIImage imageNamed:@"cameraFlash"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [_flashButton setImage:image  forState:UIControlStateNormal];
        [_flashButton setImage:[self imageMaskWithColor:kKFZCameraSelColor image:image] forState:UIControlStateSelected];
        
        [_flashButton addTarget:self action:@selector(falshButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashButton;
}

- (UIButton *)directionButton {
    if (!_directionButton) {
        _directionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"cameraFlip"];
        [_directionButton setImage:image forState:UIControlStateNormal];
        [_directionButton setImage:[self imageMaskWithColor:kKFZCameraSelColor image:image] forState:UIControlStateSelected];
        
        [_directionButton addTarget:self action:@selector(directionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _directionButton;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"cameraClose"];
        [_closeButton setImage:image forState:UIControlStateNormal];
        [_closeButton setImage:[self imageMaskWithColor:kKFZCameraSelColor image:image] forState:UIControlStateSelected];
        
        [_closeButton addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (KFZCameraShowView *)cameraShowView {
    if (!_cameraShowView) {
        __weak typeof(self) ws = self;
        _cameraShowView = [[[NSBundle mainBundle] loadNibNamed:@"KFZCameraShowView" owner:nil options:nil] lastObject];
        [self.view addSubview:_cameraShowView];
        [_cameraShowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view);
        }];
        _cameraShowView.hidden = YES;
        _cameraShowView.usePhotoBlock = ^{
            [ws closeButtonClicked];
            if (ws.delegate && [ws.delegate respondsToSelector:@selector(KFZBaseCameraVC:takeImageData:)]) {
                [ws.delegate KFZBaseCameraVC:ws takeImageData:ws.cameraShowView.imageData];
            }
        };
        _cameraShowView.reTakePhotoBlock = ^{
            [ws.session startRunning];
        };
    }
    return _cameraShowView;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    __weak typeof(self) weakSelf = self;
    // close
    [self.closeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.bottom.equalTo(weakSelf.view).offset(-22);
        make.width.height.equalTo(@40);
    }];
    // capturebutton
    [self.captureButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-5);
        make.centerX.equalTo(weakSelf.view);
        make.width.height.equalTo(@80);
    }];
    // flash
    [self.flashButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(-15);
        make.top.equalTo(weakSelf.view).offset(20);
    }];
    // direction
    [self.directionButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).offset(-20);
        make.bottom.equalTo(weakSelf.view).offset(-25);
    }];
    // preview
    [self.previewView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_flashButton.mas_bottom).offset(5);
        make.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(_captureButton.mas_top).offset(-10);
    }];
    self.previewLayer.frame = self.previewView.bounds;
}




- (UIImage *)imageMaskWithColor:(UIColor *)maskColor image:(UIImage *)image
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, image.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextTranslateCTM(ctx, 0.0f, -(imageRect.size.height));
    
    CGContextClipToMask(ctx, imageRect, image.CGImage);
    CGContextSetFillColorWithColor(ctx, maskColor.CGColor);
    CGContextFillRect(ctx, imageRect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end




















