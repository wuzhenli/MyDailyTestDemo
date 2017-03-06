//
//  KeyChainViewController.m
//  security
//
//  Created by kfz on 2017/3/6.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KeyChainViewController.h"
#import <SAMKeychain.h>

@interface KeyChainViewController ()

@end

@implementation KeyChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SAMKeychain setPassword:@"123321-aa" forService:@"aa" account:@"li"];
    [SAMKeychain setPassword:@"123321-bb" forService:@"bb" account:@"li"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *pwdAA = [SAMKeychain passwordForService:@"aa" account:@"li"];
    NSString *pwdBB = [SAMKeychain passwordForService:@"bb" account:@"li"];
    NSLog(@"%@ %@", pwdAA, pwdBB);
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
