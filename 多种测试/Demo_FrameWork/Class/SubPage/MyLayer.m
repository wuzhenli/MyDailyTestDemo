//
//  MyLayer.m
//  多种测试
//
//  Created by kfz on 16/9/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "MyLayer.h"
#import <objc/message.h>

@implementation MyLayer

+ (id)defaultValueForKey:(NSString *)key {
    if ([key isEqualToString:@"backgroundColor"]) {
        return (id)[UIColor greenColor].CGColor;
    }
    return [super defaultValueForKey:key];
}


@end














