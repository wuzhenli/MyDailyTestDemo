//
//  UIImage+extension.h
//  Kongfz
//
//  Created by kfz on 16/9/26.
//  Copyright © 2016年 dp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (extension)

/**
 * 压缩为 发送图片
 */
- (UIImage *)getSendImage ; //
/**
 * 压缩为 显示的缩略图
 */
- (UIImage *)getThumbnailImage ; //

///////////////////

/**
 * 先修正方向
 */
- (UIImage *)fixOrientation ;
/**
 * 缩小图片,指定尺寸
 */
- (UIImage *)compressImage:(UIImage *)sourceImage toTargetMaxWidthHeight:(CGFloat)maxLength ;
/**
 * 压缩图片,指定 大小
 */
- (UIImage *)compressImageToMaxFileSize:(NSInteger)maxFileSize ;

@end
