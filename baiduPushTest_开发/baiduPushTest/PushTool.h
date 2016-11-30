//
//  PushTool.h
//  baiduPushTest
//
//  Created by kfz on 16/11/30.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PushTool : NSObject

+ (void)pushWithMSg:(NSDictionary *)userInfo fromVC:(UIViewController *)fromVC ;

@end
