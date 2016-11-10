//
//  DepySub.m
//  多种测试
//
//  Created by kfz on 16/10/18.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "DepySub.h"

@implementation DepySub

- (id)copyWithZone:(nullable NSZone *)zone {
    DepySub *obj = [super copyWithZone:zone];
    obj.address = self.address;
    return obj;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    DepySub *obj = [super mutableCopyWithZone:zone];
    obj.address = [[NSString alloc] initWithFormat:@"%@", self.address];
    return obj;
}

@end
