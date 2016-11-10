//
//  NSDate+compare.m
//  多种测试
//
//  Created by kfz on 16/9/19.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NSDate+compare.h"
#define FORMATTER @"yyyy-MM-dd"

@implementation NSDate (compare)

/**
 * 是否为同一年
 */
- (BOOL)isSameYear {
    NSDate *date = [self getFormateDateWithFormatter:FORMATTER];
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        {
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat = @"yyyy-MM-dd";
//            NSString *dateStr = @"2016-09-01";
//            now = [formatter dateFromString:dateStr];
//        }
    NSCalendarUnit unit = NSCalendarUnitYear;// | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp = [calendar components:unit fromDate:date toDate:now options:NSCalendarWrapComponents];
    
    return comp.year == 0;
}
/**
 * 是否为同一月
 */
- (BOOL)isSameMonth {
    NSDate *date = [self getFormateDateWithFormatter:FORMATTER];
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //        {
    //            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //            formatter.dateFormat = @"yyyy-MM-dd";
    //            NSString *dateStr = @"2016-09-01";
    //            now = [formatter dateFromString:dateStr];
    //        }
    NSCalendarUnit unit = NSCalendarUnitMonth;// | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp = [calendar components:unit fromDate:date toDate:now options:NSCalendarWrapComponents];
    
    return comp.month == 0;
}
/**
 * 是否为同一天
 */
- (BOOL)isSameDay {
    NSDate *date = [self getFormateDateWithFormatter:FORMATTER];
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //        {
    //            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //            formatter.dateFormat = @"yyyy-MM-dd";
    //            NSString *dateStr = @"2016-09-01";
    //            now = [formatter dateFromString:dateStr];
    //        }
    NSCalendarUnit unit = NSCalendarUnitDay;// | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp = [calendar components:unit fromDate:date toDate:now options:NSCalendarWrapComponents];
    
    return comp.day == 0;
}

/**
 * 是否是昨天
 */
- (BOOL)isYesterday {
    NSDate *date = [self getFormateDateWithFormatter:FORMATTER];
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //        {
    //            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //            formatter.dateFormat = @"yyyy-MM-dd";
    //            NSString *dateStr = @"2016-09-01";
    //            now = [formatter dateFromString:dateStr];
    //        }
    NSCalendarUnit unit = NSCalendarUnitDay;// | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp = [calendar components:unit fromDate:date toDate:now options:NSCalendarWrapComponents];
    
    return comp.day == 1;
}


- (NSDate *)getFormateDateWithFormatter:(NSString *)formatterStyle {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatterStyle;
    NSString *dateStr = [formatter stringFromDate:self];
    return [formatter dateFromString:dateStr];
}

@end












