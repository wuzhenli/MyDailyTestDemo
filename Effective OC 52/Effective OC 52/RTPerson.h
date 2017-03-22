//
//  RTPerson.h
//  Effective OC 52
//
//  Created by kfz on 2017/3/21.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTPerson : NSObject

@property (copy, nonatomic) NSString *string;

@property (strong, nonatomic) NSNumber *number;

@property (strong, nonatomic) NSDate *date;

@property (strong, nonatomic) id opaqueObject;

@end
