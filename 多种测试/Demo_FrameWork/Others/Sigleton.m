//
//  Sigleton.m
//  多种测试
//
//  Created by kfz on 16/9/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "Sigleton.h"


static Sigleton *sig = nil;
@implementation Sigleton

+ (void)load {
    [super load];
    sig = [[Sigleton alloc] init];
}

@end
