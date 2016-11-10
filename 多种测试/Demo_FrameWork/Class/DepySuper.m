//
//  DepySuper.m
//  多种测试
//
//  Created by kfz on 16/10/18.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "DepySuper.h"

@implementation DepySuper

- (id)copyWithZone:(nullable NSZone *)zone {
    DepySuper *obj = [[[self class] allocWithZone:zone] init];
    obj.name = self.name;
    obj.age = self.age;
    return obj;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    DepySuper *obj = [[[self class] allocWithZone:zone] init];
    obj.name = [[NSString alloc] initWithFormat:@"%@", self.name];
    obj.age = self.age;
    return obj;
}


@end
