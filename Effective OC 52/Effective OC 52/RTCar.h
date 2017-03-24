//
//  RTCar.h
//  Effective OC 52
//
//  Created by kfz on 2017/3/22.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RTCarProtocal <NSObject>


@end

@interface RTCar : NSObject {
    NSString *_firstName;
}


@property (copy, nonatomic, readonly) NSString *firstName;


@end
