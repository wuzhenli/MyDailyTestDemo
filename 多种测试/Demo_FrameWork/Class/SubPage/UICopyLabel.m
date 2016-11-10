//
//  UICopyLabel.m
//  多种测试
//
//  Created by kfz on 16/9/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "UICopyLabel.h"

@implementation UICopyLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTap];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setTap];
}
- (void)setTap {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
}

- (void)handleTap:(UIGestureRecognizer *)gesture {
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    NSLog(@"%@", menu.menuItems);
    UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(cp)];
    UIMenuItem *delete = [[UIMenuItem alloc] initWithTitle:@"删了" action:@selector(delete)];
    menu.menuItems = @[copy, delete];
    
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(cp) || action == @selector(delete)) {
        return YES;
    }
    return NO;
}

- (void)cp {
    UIPasteboard *board = [UIPasteboard pasteboardWithName:@"myPast" create:YES];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.text];
    [board setData:data forPasteboardType:@"key"];
}
- (void)delete {
    NSLog(@"%s", __func__);
}


@end













