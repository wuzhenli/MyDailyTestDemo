//
//  SaveSecondViewController.m
//  多种测试
//
//  Created by kfz on 16/9/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SaveSecondViewController.h"

@interface SaveSecondViewController ()

@end

@implementation SaveSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)popBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self isBeingDismissed] ) {
        NSLog(@"%s   dismissed", __func__);
    } else if ( [self isMovingFromParentViewController] ) {
        NSLog(@"%s  isMovingFromParentViewController",__func__);
    } else if ( [self isBeingPresented ]) {
        NSLog(@"%s    isBeingPresented", __func__);
    } else if ( [self isMovingToParentViewController] ) {
        NSLog(@"%s     isMovingToParentViewController", __func__);
    } else {
        NSLog(@"%s     ========其他情况==========", __func__);
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self isBeingDismissed] ) {
        NSLog(@"%s   dismissed", __func__);
    } else if ( [self isMovingFromParentViewController] ) {
        NSLog(@"%s  isMovingFromParentViewController",__func__);
    } else if ( [self isBeingPresented ]) {
        NSLog(@"%s    isBeingPresented", __func__);
    } else if ( [self isMovingToParentViewController] ) {
        NSLog(@"%s     isMovingToParentViewController", __func__);
    } else {
        NSLog(@"%s     ========其他情况==========", __func__);
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
