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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end






