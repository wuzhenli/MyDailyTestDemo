//
//  SigalTest.m
//  多种测试
//
//  Created by kfz on 16/9/25.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SigalTest.h"


static SigalTest *obj = nil;

@implementation SigalTest
+ (instancetype)shareSigal {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
        NSString *name = [[NSUserDefaults standardUserDefaults] valueForKey:NAME];
        obj.name = name;
    });
    return obj;
}
@end
