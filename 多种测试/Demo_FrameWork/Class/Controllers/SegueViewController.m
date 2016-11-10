//
//  SegueViewController.m
//  多种测试
//
//  Created by kfz on 16/10/11.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SegueViewController.h"

@interface SegueViewController ()

@end

@implementation SegueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SC_Width, 100)];
        lab.backgroundColor = [UIColor redColor];
        [self.view addSubview:lab];
    }
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
