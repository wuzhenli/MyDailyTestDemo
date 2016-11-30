//
//  ViewController.m
//  baiduPushTest
//
//  Created by kfz on 16/4/28.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "PushTool.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)handlePushJump {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSDictionary *userInfo = delegate.userInfo;
    delegate.userInfo = nil;
    if (userInfo == nil) {
        [self alertMessage:@"没有推送消息"];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [PushTool pushWithMSg:userInfo fromVC:self];
    });
    
}





- (void)alertMessage:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到消息" message:msg delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alert show];

}

@end











