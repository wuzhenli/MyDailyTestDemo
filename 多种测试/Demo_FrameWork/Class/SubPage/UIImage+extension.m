//
//  UIImage+extension.m
//  多种测试
//
//  Created by kfz on 16/9/27.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)
- (UIImage *)compressImageToMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compress = 0.9;
    CGFloat maxCompress = 0.1;
    NSData *data = UIImageJPEGRepresentation(self, 1.);
    
    while ( data.length > 500 * 1024 && compress > maxCompress) {
        data = UIImageJPEGRepresentation(self, compress);
        NSLog(@"%f     %zd", compress, data.length);
        compress -= 0.1;
    }
    UIImage *image  = [UIImage imageWithData:data];
    return image;
}
@end
