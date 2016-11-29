//
//  ScaleViewController.m
//  多种测试
//
//  Created by kfz on 16/11/28.
//  Copyright © 2016年 Jaly. All rights reserved.
//  参考链接http://www.cocoachina.com/ios/20141225/10763.html

#import "ScaleViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ScaleViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) AVCaptureDevice *device;
@property (strong, nonatomic) AVCaptureDeviceInput *input;
@property (strong, nonatomic) AVCaptureMetadataOutput *output;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *preview;

@end

@implementation ScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self starScale];
//    self.navigationController.navigationBarHidden = YES;
}



- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    NSString *stringValue;
    if ([metadataObjects count] >0)
    {
        //停止扫描
        [_session stopRunning];        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;  
        self.resultLabel.text = stringValue;
    }
}


- (void)starScale {
    CGRect frame = [UIScreen mainScreen].bounds;
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    CGSize size = frame.size;
    CGRect destREct = CGRectMake(100, 120, 120, 120);
    CGFloat viewR = size.height / size.width;
    CGFloat imgR = 1920 / 1080.0;
    
    CGFloat fixHeight = 0;
    CGFloat padding = 0;
    if (viewR < imgR) {
        fixHeight = size.height * imgR;
        padding = (fixHeight - size.height)/2.;
        _output.rectOfInterest = CGRectMake((destREct.origin.y + padding)/fixHeight, destREct.origin.x/size.width, destREct.size.height/size.height, destREct.size.width/size.width);
    } else {
        fixHeight = size.height / imgR;
        padding = (size.height - fixHeight)/2.;
        
//        _output.rectOfInterest = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    }
    
    
    _output.rectOfInterest = CGRectMake(0 , 0.5, 0.25, 0.25);
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    _session.sessionPreset = AVCaptureSessionPreset1920x1080;
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity =AVLayerVideoGravityResizeAspectFill;
    
    _preview.frame = frame;
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    // Start
    [_session startRunning];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
