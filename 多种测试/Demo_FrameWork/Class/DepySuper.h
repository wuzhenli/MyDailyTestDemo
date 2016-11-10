//
//  DepySuper.h
//  多种测试
//
//  Created by kfz on 16/10/18.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DepySuper : NSObject<NSCopying, NSMutableCopying>

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) int age;

@end
