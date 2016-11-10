//
//  NotificationTool.m
//  多种测试
//
//  Created by kfz on 16/9/25.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NotificationTool.h"

@implementation NotificationTool

+ (void)registerLocalNotification:(NSString *)string {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.userInfo = @{
                              @"contaciId" : @"39020e2",
                              @"name" : @"lily",
                              @"photo" : @"http://www.djeo.jpg"
                              };
    notification.fireDate = [NSDate date];
    
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatInterval = 0;
    notification.alertBody = string;
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    notification.applicationIconBadgeNumber = badge + 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

+ (void)cancelNotification {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end









