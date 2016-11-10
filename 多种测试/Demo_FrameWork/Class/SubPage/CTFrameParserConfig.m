//
//  CTFrameParserConfig.m
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        _width = 200.;
        _fontSize = 16.;
        _lineSpace = 8.;
        _textColor = RGB(108, 108, 108);
    }
    return self;
}

@end
