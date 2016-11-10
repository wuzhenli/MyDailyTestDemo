//
//  NSString+extension.m
//  多种测试
//
//  Created by kfz on 16/10/9.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NSString+extension.h"

@implementation NSString (extension)
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
@end
