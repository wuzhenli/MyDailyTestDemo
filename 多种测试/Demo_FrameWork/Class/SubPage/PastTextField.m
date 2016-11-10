//
//  PastTextField.m
//  多种测试
//
//  Created by kfz on 16/9/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PastTextField.h"

@implementation PastTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(paste:)) {
        return YES;
    }
    return NO;
}
- (void)paste:(id)sender {
    UIPasteboard *board = [UIPasteboard pasteboardWithName:@"myPast" create:YES];
    NSString *str = [NSKeyedUnarchiver unarchiveObjectWithData:[board dataForPasteboardType:@"key"]];
    NSLog(@"%@", str);
    self.text = str;
}

@end
