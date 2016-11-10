//
//  LLButton.m
//  多种测试
//
//  Created by kfz on 16/8/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "LLButton.h"

@implementation LLButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.exclusiveTouch = YES;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    UIView *v = [[UIView alloc] initWithFrame:self.imageView.frame];
//    v.backgroundColor = [UIColor blackColor]; //  [[UIColor blackColor] colorWithAlphaComponent:0.8];
//    self.maskView = v;
//}
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesEnded:touches withEvent:event];
//    self.maskView = nil;
//}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.imageView.frame;
    rect.origin.x = (self.frame.size.width - rect.size.width)/2.;
    rect.origin.y = 0;
    self.imageView.frame = rect;
    CGFloat y = rect.size.height;
    rect = self.titleLabel.frame;
    rect.origin = CGPointMake(0, y);
    rect.size = CGSizeMake(self.frame.size.width, self.frame.size.height - y);
    self.titleLabel.frame = rect;
}

@end
