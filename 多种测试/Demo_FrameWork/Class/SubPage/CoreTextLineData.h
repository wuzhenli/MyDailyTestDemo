//
//  CoreTextLineData.h
//  多种测试
//
//  Created by kfz on 16/8/27.
//  Copyright © 2016年 Jaly. All rights reserved.
//  链接 类

#import <Foundation/Foundation.h>

@interface CoreTextLineData : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *url;
@property (assign, nonatomic) NSRange range;

- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url range:(NSRange)range ;

@end
