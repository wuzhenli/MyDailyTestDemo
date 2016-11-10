//
//  JLDBTool.h
//  多种测试
//
//  Created by kfz on 16/9/9.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLDBTool : NSObject

+ (void)insertImage:(UIImage *)imageIn imgId:(NSString *)imgId ;
+ (UIImage *)queryImageById:(NSString *)imgId ;
@end
