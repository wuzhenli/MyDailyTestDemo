//
//  MyView.m
//  多种测试
//
//  Created by kfz on 16/8/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "MyView.h"

@interface MyView ()
@property (weak, nonatomic) UILabel *label1;
@property (weak, nonatomic) UILabel *label2;

@end

@implementation MyView
- (UILabel *)label1 {
    if (!_label1) {
        UILabel *l = [[UILabel alloc] init];
        l.frame = CGRectMake(10, 10, 100, 30);
        l.backgroundColor = [UIColor orangeColor];
        [self addSubview:l];
        _label1 = l;
    }
    return _label1;
}
- (UILabel *)label2 {
    if (!_label2) {
        UILabel *l = [[UILabel alloc] init];
        l.frame = CGRectMake(10, 101, 100, 30);
        l.backgroundColor = [UIColor orangeColor];
        [self addSubview:l];
        _label2 = l;
    }
    return _label2;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self label2];
    [self label1];
}

- (UIView *)viewForLastBaselineLayout {
    return self.label1;
}

@end










