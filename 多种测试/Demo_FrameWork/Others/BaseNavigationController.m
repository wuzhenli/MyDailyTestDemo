//
//  BaseNavigationController.m
//  多种测试
//
//  Created by kfz on 16/10/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

+ (void)initialize {
    // 设置 两侧按钮 的颜色tintColor(标题除外)
    [[UINavigationBar appearance] setTintColor:[UIColor orangeColor]]; // FGCOLOR 设置返回按钮的颜色tintColor(标题除外)
    // 导航栏 背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor cyanColor]];
    // 标题属性
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[UIColor blackColor],
                                                           NSFontAttributeName : [UIFont systemFontOfSize:18]
                                                           }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
