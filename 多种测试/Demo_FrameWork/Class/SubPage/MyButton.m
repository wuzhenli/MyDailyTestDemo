//
//  MyButton.m
//  多种测试
//
//  Created by kfz on 16/8/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (UIEdgeInsets)alignmentRectInsets {
    return UIEdgeInsetsMake(30, 0, 10, 10);
}
- (CGRect)alignmentRectForFrame:(CGRect)frame {
    
    frame.origin.y = 30;
    frame.size.height -= 30;
    return frame;
}

- (CGRect)frameForAlignmentRect:(CGRect)alignmentRect {
    return alignmentRect;
}




@end
