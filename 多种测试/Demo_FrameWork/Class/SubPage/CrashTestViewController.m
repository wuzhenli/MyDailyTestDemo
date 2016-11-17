//
//  CrashTestViewController.m
//  多种测试
//
//  Created by kfz on 16/11/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CrashTestViewController.h"

@interface CrashTestViewController ()

@end

@implementation CrashTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    (lldb) po arrayMClass
//    __NSArrayM
//    
//    (lldb) po tmpC
//    NSMutableArray
//    
//    (lldb) po [tmpC class]
//    NSMutableArray
    
 

    
    
    
    [self testCrash];
}

- (void)testCrash {
    NSString *nilStr = nil;
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:nilStr];
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
