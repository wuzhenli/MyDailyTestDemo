//
//  NSDate+compare.h
//  多种测试
//
//  Created by kfz on 16/9/19.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (compare)

/**
 * 是否同一年
 */
- (BOOL)isSameYear ;
/**
 * 是否同一月
 */
- (BOOL)isSameMonth ;
/**
 * 是否同一天
 */
- (BOOL)isSameDay ;
/**
 * 是否是昨天
 */
- (BOOL)isYesterday ;

@end
