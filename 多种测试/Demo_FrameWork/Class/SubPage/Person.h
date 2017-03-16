//
//  Person.h
//  多种测试
//
//  Created by kfz on 2017/3/10.
//  Copyright © 2017年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
{
    int _propertyInt;
    NSString *_propertyStr;
}

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *uid;

@property (assign, nonatomic) BOOL validataPhone;
@property (assign, nonatomic) BOOL validataMail;
@property (assign, nonatomic, getter=isSeller) BOOL seller;

@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) CGFloat weight;

@property (copy, nonatomic) NSString *phoneNum;

- (void)save;
+ (instancetype)sharePerson ;

@end
