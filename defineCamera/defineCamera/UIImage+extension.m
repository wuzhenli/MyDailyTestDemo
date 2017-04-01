//
//  UIImage+extension.m
//  Kongfz
//
//  Created by kfz on 16/9/26.
//  Copyright © 2016年 dp. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)

/**
 * 压缩为 发送图片
 */
- (UIImage *)getSendImage {
    UIImage *image = [self fixOrientation];
    image = [image compressImageToMaxFileSize:240 * 1024];
    image = [self compressImage:image toTargetMaxWidthHeight:1024];
    return image;
}
/**
 * 压缩为 显示的缩略图
 */
- (UIImage *)getThumbnailImage {
    UIImage *image = [self fixOrientation];
    image = [image compressImageToMaxFileSize:30 * 1024];
    image = [self compressImage:image toTargetMaxWidthHeight:128];
    return image;
}//

///////////////////


- (UIImage *)compressImageToMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compress = 0.9;
    CGFloat maxCompress = 0.05;
    NSData *data = UIImageJPEGRepresentation(self, 1.);
    
    while ( data.length > maxFileSize && compress > maxCompress) {
        data = UIImageJPEGRepresentation(self, compress);
        compress -= 0.2;
    }
    UIImage *image  = [UIImage imageWithData:data];
    return image;
}

- (UIImage *)compressImage:(UIImage *)sourceImage toTargetMaxWidthHeight:(CGFloat)maxLength {
    CGSize imageSize = sourceImage.size;
    if (imageSize.width < maxLength && imageSize.height < maxLength) {
        return sourceImage;
    }
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
 
    CGFloat targetHeight = 0;
    CGFloat targetWidth = 0;
    
    if (width >= height) {
        targetWidth = maxLength;
        targetHeight = targetWidth * height / width;
    } else {
        targetHeight = maxLength;
        targetWidth = width * targetHeight / height;
    }
    
    
    
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 * 发送图片前，先修正方向，并压缩
 */
- (UIImage *)fixOrientationAndCompressImage {
    UIImage *image = [self fixOrientation];
    image = [self compressImage:image toTargetMaxWidthHeight:1024];
    
    return image;
}

- (UIImage *)fixOrientation {
    UIImage *aImage = self;
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}
@end
