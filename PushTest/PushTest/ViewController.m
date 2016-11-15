//
//  ViewController.m
//  PushTest
//
//  Created by 天蓝 on 2016/10/31.
//  Copyright © 2016年 PT. All rights reserved.
//  项目链接  http://code.cocoachina.com/view/133335
//  文章链接  http://www.cocoachina.com/ios/20161110/18024.html


#import "ViewController.h"
#import "TestViewController.h"

#define U_ARCRANDOM_COLOR [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = U_ARCRANDOM_COLOR;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
