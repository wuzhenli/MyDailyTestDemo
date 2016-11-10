//
//  NavViewController.m
//  多种测试
//
//  Created by kfz on 16/8/26.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NavViewController.h"
#import <objc/runtime.h>

@interface NavViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self test];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *color = [UIColor colorWithRed:41/255. green:128/255. blue:185/255. alpha:1.];
//    [self.navigationController.navigationBar setBarTintColor:color];
//    self.navigationController.navigationBar.backgroundColor = color;
//    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    self.navigationController.navigationBar.backgroundColor = color;
    self.navigationController.navigationBar.translucent = NO;
    
    self.label.backgroundColor = color;
    
}

- (void) test {
    // 成员变量的数量
    unsigned int outCount = 0;
    
    // 获得所有的成员变量
    // ivars是一个指向成员变量的指针
    // ivars默认指向第0个成员变量（最前面）
    Ivar *ivars = class_copyIvarList([UINavigationController class], &outCount);
    // 遍历所有的成员变量
    for (int i = 0; i<outCount; i++) {
        // 取出i位置对应的成员变量
        //            Ivar ivar = *(ivars + i);
        Ivar ivar = ivars[i];
        // 获得成员变量的名字
        NSLog(@"%s          %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
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












