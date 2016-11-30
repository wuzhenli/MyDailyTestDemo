//
//  PushTool.m
//  baiduPushTest
//
//  Created by kfz on 16/11/30.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "PushTool.h"
#import "RedViewController.h"
#import "GreenViewController.h"

@implementation PushTool


+ (void)pushWithMSg:(NSDictionary *)userInfo fromVC:(UIViewController *)fromVC {
    if ( ![[userInfo allKeys] containsObject:@"page"]) {
        [self alertMessage:@"none page"];
        return;
    }
    
    
    NSString *page = userInfo[@"page"];
    
//    NSString *showString = [NSString stringWithFormat:@"ready jump %@", page];
    
    UIViewController *vc = nil;
    if ([page isEqualToString:@"Red"]) {
        vc = [[RedViewController alloc] init];
    } else {
        vc = [[GreenViewController alloc] init];
    }
    
    if ([fromVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)fromVC;
        [nav pushViewController:vc animated:YES];
    } else {
        [vc.navigationController pushViewController:vc animated:YES];
    }
}



+ (void)alertMessage:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到消息" message:msg delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    
}

@end
