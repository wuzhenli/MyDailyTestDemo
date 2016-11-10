//
//  NSString+ex.m
//  多种测试
//
//  Created by kfz on 16/9/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NSString+ex.h"
#import <objc/message.h>

@implementation NSString (ex)

- (BOOL)containsString:(NSString *)subStr {
    NSRange range = [self rangeOfString:subStr];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

@end
