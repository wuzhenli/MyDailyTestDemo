//
//  BBViewController.m
//  多种测试
//
//  Created by kfz on 16/8/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"before  %s", __func__);
    [super viewDidAppear:animated];
    NSLog(@"after  %s", __func__);
}
- (IBAction)popViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
