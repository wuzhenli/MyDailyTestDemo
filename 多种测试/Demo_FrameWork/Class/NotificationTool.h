//
//  NotificationTool.h
//  多种测试
//
//  Created by kfz on 16/9/25.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationTool : NSObject

+ (void)registerLocalNotification:(NSString *)string ;

+ (void)cancelNotification ;

@end
