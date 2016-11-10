//
//  ButtonScaleViewController.m
//  多种测试
//
//  Created by kfz on 16/6/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ButtonScaleViewController.h"

@interface ButtonScaleViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation ButtonScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UIButton  :  UIControl  :   UIView  :   UIResponder  :  NSObject
    //                       UIViewController : UIResponder
    //                   UILabel  :  UIView
    //    APPDelegate
    //    UIApplication : UIResponder
    
}

- (IBAction)scaleSmall:(UIButton *)sender {
    CGFloat scale = [sender.currentTitle floatValue];
    self.btn.transform = CGAffineTransformMakeScale(scale, scale);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
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



