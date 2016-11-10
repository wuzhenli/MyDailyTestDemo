//
//  AdjustString.h
//  多种测试
//
//  Created by kfz on 16/10/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjustString : NSObject
/** 判断是否是纯数字 */
+ (BOOL)isNumberComplete:(NSString *)string ;
+(BOOL) isHanzi:(NSString *)string ;



/**
 * 注册
 合法 字符串
 */
+ (BOOL)isLegalRegistCharacter:(NSString *)str ;
/** 是孔网注册字符 */
+ (BOOL)isRegistCharacter:(unichar)c ;
+ (BOOL)isCharacter:(NSString *)str ;
/**
 * 孔网注册的特殊字符
 * -  _  @  .
 */
+ (BOOL)isRegisterSpecialCharacter:(NSString *)str ;
@end
