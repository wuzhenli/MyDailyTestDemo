//
//  Person_Ar.h
//  多种测试
//
//  Created by kfz on 16/10/11.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person_Ar : NSObject<NSCoding>

@property (copy, nonatomic) NSString *accessToken;
@property (copy, nonatomic) NSString *refreshToken;

/** 是否被删除 */
@property (assign, nonatomic) BOOL isDelete;
/** 是否被禁止 */
@property (assign, nonatomic) BOOL isForbidden;
/** 是否验证账号 */
@property (assign, nonatomic) BOOL isVerified;

@property (assign, nonatomic) BOOL isEmailChecked;
@property (assign, nonatomic) BOOL isMobileChecked;
@property (assign, nonatomic) BOOL isNewUser;
/** 是否设置的密保 */
@property (assign, nonatomic) BOOL isPassQuestion;


@property (copy, nonatomic) NSString *lastLoginTime;
@property (copy, nonatomic) NSString *mobile;
@property (copy, nonatomic) NSString *email;

@property (copy, nonatomic) NSString *nickname;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *photo;
/** 包含 [shopkeeper] 为 店主 , 包含 [auctioneer] 拍主 */
@property (copy, nonatomic) NSString *userType;
@property (assign, nonatomic) NSInteger userId;

@end
