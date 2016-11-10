//
//  AdjustString.m
//  多种测试
//
//  Created by kfz on 16/10/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AdjustString.h"

@implementation AdjustString
/** 判断是否是纯数字 */
+ (BOOL)isNumberComplete:(NSString *)string {
    NSUInteger i;
    for (i = 0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (c > '9' || c < '0') {
            return NO;
        }
    }
    return YES;
}
+(BOOL) isHanzi:(NSString *)string
{
    NSString *regex = @"^[\u4e00-\u9fa5]";
    NSPredicate *str = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [str evaluateWithObject:string];
}



/**
 * 注册
 合法 字符串
 */
+ (BOOL)isLegalRegistCharacter:(NSString *)str {
    // 先判断第一个 字符是否为 汉字、字母
    NSString *firstStr = [str substringToIndex:1];
    if ( [self isHanzi:firstStr] || [self isCharacter:firstStr]) {
        ;
    } else {
        return NO;
    }
    unichar c;
    for (int i=0; i<str.length; i++) {
        c = [str characterAtIndex:i];
        if (![self isRegistCharacter:c]) {
            return NO;
        }
    }
    
    return YES;
}
/** 是孔网注册字符 */
+ (BOOL)isRegistCharacter:(unichar)c {
    BOOL ret = NO;
    NSString *str = [NSString stringWithFormat:@"%c", c];
    if ([self isHanzi:str] || [self isNumberComplete:str] || [self isCharacter:str] || [self isRegisterSpecialCharacter:str]) {
        ret = YES;
    } else {
        ret = NO;
    }
    
    return ret;
}
+ (BOOL)isCharacter:(NSString *)str {
    for (int i=0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if ( (c >= 'a' && c<= 'z') || (c >= 'A' && c<= 'Z') ) {
            continue;
        } else {
            return NO;
        }
    }
    return YES;
}
/**
 * 孔网注册的特殊字符
 * -  _  @  .
 */
+ (BOOL)isRegisterSpecialCharacter:(NSString *)str {
    for (int i=0; i<str.length; i++) {
        unichar c = [str characterAtIndex:i];
        if ( c == '-' || c == '_' || c == '@' || c == '.') {
            continue;
        } else {
            return NO;
        }
    }
    return YES;
}
@end
