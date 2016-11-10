//
//  Person_Ar.m
//  多种测试
//
//  Created by kfz on 16/10/11.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "Person_Ar.h"

@implementation Person_Ar
#pragma -mark 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //    [aCoder encodeObject:self.name forKey:@"name"];
    //    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
    [aCoder encodeObject:self.refreshToken forKey:@"refreshToken"];
    
    [aCoder encodeBool:self.isDelete forKey:@"isDelete"];
    /** 是否被禁止 */
    [aCoder encodeBool:self.isForbidden forKey:@"isForbidden"];
    /** 是否验证账号 */
    [aCoder encodeBool:self.isVerified forKey:@"isVerified"];
    [aCoder encodeBool:self.isEmailChecked forKey:@"isEmailChecked"];
    [aCoder encodeBool:self.isMobileChecked forKey:@"isMobileChecked"];
    [aCoder encodeBool:self.isNewUser forKey:@"isNewUser"];
    /** 是否设置的密保 */
    [aCoder encodeBool:self.isPassQuestion forKey:@"isPassQuestion"];
    
    [aCoder encodeObject:self.lastLoginTime forKey:@"lastLoginTime"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.email forKey:@"email"];
    
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.photo forKey:@"photo"];
    /** 包含 [shopkeeper] 为 店主 , 包含 [auctioneer] 拍主 */
    [aCoder encodeObject:self.userType forKey:@"userType"];
    [aCoder encodeInteger:self.userId forKey:@"userId"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        //        self.name = [aDecoder decodeObjectForKey:@"name"];
        //        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        //        self.age = [aDecoder decodeIntForKey:@"age"];
        //        --------
        self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
        self.refreshToken = [aDecoder decodeObjectForKey:@"refreshToken"];
        
        self.isDelete = [aDecoder decodeBoolForKey:@"isDelete"];
        /** 是否被禁止 */
        self.isForbidden = [aDecoder decodeBoolForKey:@"isForbidden"];
        /** 是否验证账号 */
        self.isVerified = [aDecoder decodeBoolForKey:@"isVerified"];
        self.isEmailChecked = [aDecoder decodeBoolForKey:@"isEmailChecked"];
        self.isMobileChecked = [aDecoder decodeBoolForKey:@"isMobileChecked"];
        self.isNewUser = [aDecoder decodeBoolForKey:@"isNewUser"];
        /** 是否设置的密保 */
        self.isPassQuestion = [aDecoder decodeBoolForKey:@"isPassQuestion"];
        
        self.lastLoginTime = [aDecoder decodeObjectForKey:@"lastLoginTime"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.photo = [aDecoder decodeObjectForKey:@"photo"];
        
        /** 包含 [shopkeeper] 为 店主 , 包含 [auctioneer] 拍主 */
        self.userType = [aDecoder decodeObjectForKey:@"userType"];
        self.userId = [aDecoder decodeIntegerForKey:@"userId"];
    }
    
    return self;
}
@end
