//
//  DepyCopyViewController.m
//  多种测试
//
//  Created by kfz on 16/10/18.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "DepyCopyViewController.h"
#import "DepySub.h"

@interface DepyCopyViewController ()
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation DepyCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试 拷贝
//    [self testCopy];
    
    [self testTimerCallClassMethod];
}
+ (void)timerRun {
    NSLog(@"%s", __func__);
}
- (void)secondMethod {
    [[self class] timerRun];
}

- (void)testTimerCallClassMethod {
    self.timer = [NSTimer timerWithTimeInterval:1. target:self selector:@selector(secondMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}
- (void)testCopy {
    DepySub *s = [[DepySub alloc] init];
    s.name = @"super";
    s.address = @"address";
    s.age = 12;
    
    DepySub *s2 = [s mutableCopy];
    NSLog(@"obj:%p   %p",s, s2);
    NSLog(@"name:%p   %p",s.name, s2.name);
    NSLog(@"address:%p   %p",s.address, s2.address);
    NSLog(@"age:%d   %d", s.age, s2.age);
    
    
}



@end
























