//
//  RTStudent.h
//  Effective OC 52
//
//  Created by kfz on 2017/3/22.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RTCar;

@interface RTStudent : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSUInteger age;
@property (strong, nonatomic) RTCar *car;

@end
