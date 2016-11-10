//
//  LineView.m
//  多种测试
//
//  Created by kfz on 16/9/24.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "LineView.h"

@implementation LineView


- (void)drawRect:(CGRect)rect {
    // 获取当前图形，视图推入堆栈的图形，相当于你所要绘制图形的图纸
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 创建一个新的空图形路径。
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 10, 10);
    
    CGContextAddLineToPoint(ctx, 10, 260);
//    CGContextAddLineToPoint(ctx, 260, 260);
    
    
    CGContextSetLineWidth(ctx, 0.1);
    
    CGContextClosePath(ctx);
    
    // 设置当前视图填充色
//    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    
    // 绘制当前路径区域
    CGContextDrawPath(ctx, kCGPathStroke);
}


@end

















