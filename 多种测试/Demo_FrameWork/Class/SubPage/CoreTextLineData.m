//
//  CoreTextLineData.m
//  多种测试
//
//  Created by kfz on 16/8/27.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CoreTextLineData.h"

@implementation CoreTextLineData
- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url range:(NSRange)range {
    if (self = [super init]) {
        self.title = title;
        self.url = url;
        self.range = range;
    }
    return self;
}
@end
