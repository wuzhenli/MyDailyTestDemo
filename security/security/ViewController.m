//
//  ViewController.m
//  security
//
//  Created by kfz on 2017/3/6.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import <SAMKeychain.h>
#import "KeychainItemWrapper.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KeychainItemWrapper *chain = [[KeychainItemWrapper alloc] initWithIdentifier:@"www.kongfz.com.security" accessGroup:@"com.kongfz.www"];
    [chain setObject:@"passowrd.kongfz" forKey:(__bridge id)kSecValueData];
    NSString *psw = [chain objectForKey:(__bridge id)kSecValueData];
    NSLog(@"%@", psw);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
