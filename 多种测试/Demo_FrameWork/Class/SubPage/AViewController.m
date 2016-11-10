//
//  AViewController.m
//  多种测试
//
//  Created by kfz on 16/8/11.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import "Tools.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BViewController *vc = [[BViewController alloc] init];
    
    UIViewController *v = [Tools getCurrentVC];
    [v.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"%@",[v class]);
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
