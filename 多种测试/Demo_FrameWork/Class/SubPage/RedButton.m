//
//  RedButton.m
//  多种测试
//
//  Created by kfz on 16/8/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "RedButton.h"

@implementation RedButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s  %lu",__func__, (unsigned long)touches.count);
}

@end
