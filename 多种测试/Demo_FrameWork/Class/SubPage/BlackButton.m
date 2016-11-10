//
//  BlackButton.m
//  多种测试
//
//  Created by kfz on 16/8/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BlackButton.h"

@interface BlackButton ()


@end

@implementation BlackButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s  %lu",__func__, (unsigned long)touches.count);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *hitView in self.subviews) {
        CGPoint p = [hitView convertPoint:point toView:hitView];
        if ( [hitView pointInside:p withEvent:event] ) {
            NSLog(@"点击了tag = %lu", (long)hitView.tag);
            return hitView;
        }
    }
    NSLog(@"点击了黑色按钮");
    return self;
}

@end
