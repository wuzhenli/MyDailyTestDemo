//
//  KFZImageDBTool.h
//  Kongfz
//
//  Created by kfz on 16/9/9.
//  Copyright © 2016年 dp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFZImageDBTool : NSObject

/**
 * 开启数据库
 */
+ (BOOL)openDatatase ;
/**
 * 保存图片
 */
+ (void)insertImage:(UIImage *)imageIn clientMsgId:(NSString *)imgId ;
/**
 * 查找图片
 */
+ (UIImage *)queryImageById:(NSString *)imgId ;

/**
 * 关闭数据库
 */
+ (void)closeDB ;

/**
 * 删除数据库
 */
+ (void)deleteDB ;

@end
