//
//  RTStudent.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/22.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "RTStudent.h"
#import "RTCar.h"

@implementation RTStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        _car = [RTCar new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    BOOL b = [super resolveInstanceMethod:sel];
    NSLog(@"resolveInstanceMethod : sel:%@ result:%d", NSStringFromSelector(sel), b?1:0);
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"%s", __func__);
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"run"]) {
//        return self.car;
//    }
    id r = [super forwardingTargetForSelector:aSelector];
    NSLog(@"%s : return:%@", __func__, r);
    return [super forwardingTargetForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"%s", __func__);
    SEL aSelector = [invocation selector];
    
    if ([_car respondsToSelector:aSelector])
        [invocation invokeWithTarget:_car];
    else
        [super forwardInvocation:invocation];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s", __func__);
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (! signature) {
        //生成方法签名
        signature = [_car methodSignatureForSelector:aSelector];
    }
    
    return signature;
}

@end

















