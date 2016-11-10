//
//  ArchiveViewController.m
//  多种测试
//
//  Created by kfz on 16/10/11.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ArchiveViewController.h"
#import "Person_Ar.h"

@interface ArchiveViewController ()

@end

@implementation ArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person_Ar *p = [[Person_Ar alloc] init];
    p.accessToken = @"accessToken";
    p.refreshToken = @"refreshToken";
    p.isDelete = 1;
    /** 是否被删除 */
    /** 是否被禁止 */
    p.isForbidden = 1;
    /** 是否验证账号 */
    p.isVerified = 1;
    
    p.isEmailChecked = 0;
    p.isMobileChecked = 0;
    p.isNewUser = 1;
    /** 是否设置的密保 */
    p.isPassQuestion = 1;
    
    
    p.lastLoginTime = @"lastLoginTime";
    p.mobile = @"mobile";
    p.email = @"email";
    
    
    p.nickname = @"nickname";
    
    p.username = @"username";
    
    p.photo = @"photo";
    p.userType = @"userType";
  
    p.userId = 123344;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", path);
    NSString *file = [path stringByAppendingPathComponent:@"person.plist"];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
    [data writeToFile:file atomically:YES];
    
    NSData *dateN = [NSData dataWithContentsOfFile:file];
    Person_Ar *pN = [NSKeyedUnarchiver unarchiveObjectWithData:dateN];
    NSLog(@"%@", pN);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
