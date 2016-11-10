//
//  InLabel.m
//  多种测试
//
//  Created by kfz on 16/9/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "InLabel.h"

@implementation InLabel

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    return CGSizeMake(size.width + 15, size.height + 12);
}

@end
