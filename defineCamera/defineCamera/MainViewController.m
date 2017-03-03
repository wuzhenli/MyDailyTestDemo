//
//  MainViewController.m
//  defineCamera
//
//  Created by kfz on 2017/3/3.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "MainViewController.h"
#import "KFZBaseCameraVC.h"

@interface MainViewController ()<KFZBaseCameraVCDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *aniView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)takePhoto:(id)sender {
    KFZBaseCameraVC *baseVC = [[KFZBaseCameraVC alloc] init];
    baseVC.delegate = self;
    [self presentViewController:baseVC animated:YES completion:nil];
}

- (void)KFZBaseCameraVC:(KFZBaseCameraVC *)vc takeImageData:(NSData *)data {
    self.imgView.image = [UIImage imageWithData:data];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 =  -1.0 / 1000.;
    transform = CATransform3DTranslate(transform, 0, 0, 50);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.aniView.layer.transform = CATransform3DRotate(transform, -M_PI/2, 0, 1, 0);
        self.aniView.alpha = 0.8;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.aniView.alpha = 1.;
            self.aniView.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            ;
        }];
    }];
    
    
    /*
     typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
     UIDeviceOrientationUnknown,
     UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
     UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
     UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
     UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
     UIDeviceOrientationFaceUp,              // Device oriented flat, face up
     UIDeviceOrientationFaceDown             // Device oriented flat, face down
     } __TVOS_PROHIBITED;
     */
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













