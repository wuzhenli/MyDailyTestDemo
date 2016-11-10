//
//  UITestViewController.m
//  多种测试
//
//  Created by kfz on 16/9/18.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "UITestViewController.h"

@interface UITestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation UITestViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:@"UITestViewController" bundle:nil]) {
        ;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    bubble-classic-selected
    UIImageView *imageViewMask = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble-classic-selected"]];
    imageViewMask.frame = CGRectInset(self.imgView.bounds, 2.0f, 2.0f);
    
//    view.layer.mask = imageViewMask.layer;
    self.imgView.layer.mask = imageViewMask.layer;
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
