//
//  CFViewController.m
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CFViewController.h"
#import <CoreText/CoreText.h>

@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    NSDictionary *atts = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:14]
                           };
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:@"abc" attributes:atts];
    CFStringRef cfStr = (CFStringRef)@"abc";
    CFMutableAttributedStringRef attCfStr = CFAttributedStringCreateMutable(NULL, 0);
    CFAttributedStringReplaceString(attCfStr, CFRangeMake(0, 0), cfStr);
    CFMutableDictionaryRef styleDic = CFDictionaryCreateMutable(NULL, 0, 0, 0);
    CFDictionaryAddValue(styleDic, kCTForegroundColorAttributeName, [UIColor redColor].CGColor);
    CFAttributedStringSetAttributes(attCfStr, CFRangeMake(0, 1), styleDic, 0);
    
    NSLog(@"%@",(__bridge NSAttributedString *)attCfStr);
}


@end














