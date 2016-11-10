//
//  UIImage+extension.m
//  多种测试
//
//  Created by kfz on 16/9/29.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)

- (UIImage *)setCornerRadious:(CGFloat)cornerRadiou {
    CGSize imageSize = self.size;
    //UIImage绘制为圆角
    int w = imageSize.width;
    int h = imageSize.height;
    int radius = imageSize.width/2;
    
    UIImage *img = self;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
//    addRoundedRectToPath(context, rect, radius, radius);
    
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    return self;
}

@end
