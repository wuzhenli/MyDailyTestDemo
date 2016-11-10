//
//  CalenderViewController.m
//  多种测试
//
//  Created by kfz on 16/6/28.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CalenderViewController.h"

@interface CalenderViewController ()

@end

@implementation CalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"2016-06-29 08:54:52"];
    [array addObject:@"2016-06-28 23:54:52"];
    [array addObject:@"2016-06-28 08:54:52"];
    [array addObject:@"2016-05-28 08:54:52"];
    [array addObject:@"2016-04-28 08:54:52"];
    [array addObject:@"2016-03-28 08:54:52"];
    [array addObject:@"2013-06-28 08:54:52"];
    [array addObject:@"2014-06-28 08:54:52"];
    
    for (NSString *time in array) {
        NSString *showTime = [self getFormetterTimeWithTime:time];
        NSLog(@"%@:%@",time,showTime);
    }
    
}

- (NSString *)getFormetterTimeWithTime:(NSString *)time {
    time = [[time componentsSeparatedByString:@" "] firstObject];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromDate = [formatter dateFromString:time];
    NSDate *now = [NSDate date];
    
    NSString *retTime = nil;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:now options:NSCalendarWrapComponents];
    switch (comp.day) {
        case 0:{
            retTime = @"今日上书";
            break;
        }
        case 1:{
            retTime = @"昨日上书";
            break;
        }
        default:{
            retTime = time;
            break;
        }
    }
    
    return retTime;
}



@end














