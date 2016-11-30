//
//  AppDelegate.m
//  baiduPushTest
//
//  Created by kfz on 16/4/28.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "AppDelegate.h"
#import "BPush.h"
#import "ViewController.h"
#import "PushTool.h"
#import "PushTool.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

static NSString *key = @"0MHKzVFaLkqIICLGbkty2HVo";

@interface AppDelegate ()
@property (assign, nonatomic, getter=isNotificationLaunch) BOOL notificationLaunch;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // iOS10 下需要使用新的 API
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge)
                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                  // Enable or disable features based on authorization.
                                  if (granted) {
                                      [application registerForRemoteNotifications];
                                  }
                              }];
#endif
    }
    else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationType myTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }else {
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
    }
    
        //    BPushModeDevelopment    BPushModeProduction
    [BPush registerChannel:launchOptions apiKey:key pushMode:BPushModeDevelopment withFirstAction:@"打开" withSecondAction:@"回复" withCategory:@"TTT" useBehaviorTextInput:YES isDebug:YES];
    
    
    NSDictionary *userDic = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userDic) {
        [BPush handleNotification:userDic];
    }
#if TARGET_IPHONE_SIMULATOR
    Byte dt[32] = {0xc6, 0x1e, 0x5a, 0x13, 0x2d, 0x04, 0x83, 0x82, 0x12, 0x4c, 0x26, 0xcd, 0x0c, 0x16, 0xf6, 0x7c, 0x74, 0x78, 0xb3, 0x5f, 0x6b, 0x37, 0x0a, 0x42, 0x4f, 0xe7, 0x97, 0xdc, 0x9f, 0x3a, 0x54, 0x10};
    [self application:application didRegisterForRemoteNotificationsWithDeviceToken:[NSData dataWithBytes:dt length:32]];
#endif
//    
    NSDictionary *remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    
    [NSThread sleepForTimeInterval:1.5];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
    
    if (remoteNotification) {
        self.userInfo = remoteNotification;
        [self handleNotification];
    }
    
    return YES;
}


/**
 处理百度推送的跳转
 */
- (void)handleNotification {
    [PushTool pushWithMSg:self.userInfo fromVC:self.window.rootViewController];
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"%@", userInfo);
    if (application.applicationState != UIApplicationStateActive) {
        UIViewController *rootVC = self.window.rootViewController;
        [PushTool pushWithMSg:userInfo fromVC:rootVC];
    }
    
}

/// 通知代理成功注册APNs
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"\n----deviceToken:%@", deviceToken);
    [BPush registerDeviceToken:deviceToken];
    // BPushCallBack中有绑定结果的反馈，error_code 为0时绑定成功。绑定成功后可以获取appid,channelid,userid等信息。
    [BPush bindChannelWithCompleteHandler:^(id result, NSError *error) {
        if (error) {
            NSLog(@"%s-----%@",__func__,error);
            return ;
        }
        if (result) {
            if ([result[@"error_code"] intValue] != 0) { // 0时绑定成功
                return;
            }
            // get channel_id
            NSString *channel_id = [BPush getChannelId];
            NSLog(@"＝＝＝＝＝＝＝＝＝＝＝＝＝＝channel_id:%@",channel_id);
            
            [BPush listTagsWithCompleteHandler:^(id result, NSError *error) {
                NSLog(@"%@",result);
            }];
        }
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"DeviceToken 获取失败，原因：%@",error);
}

@end
