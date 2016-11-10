//
//  TextKitViewController.m
//  多种测试
//
//  Created by kfz on 16/8/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "TextKitViewController.h"

@interface TextKitViewController ()

@property (strong, nonatomic) NSLayoutManager *layoutManager;
@property (strong, nonatomic) NSTextStorage *textStorage;

@end

@implementation TextKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)testTextStorage {
//    NSTextStorage : NSMutableAttributedString : NSAttributedString
    NSURL *url =  [[NSBundle mainBundle] URLForResource:@"content.txt" withExtension:nil];
    self.textStorage = [[NSTextStorage alloc] initWithURL:url options:nil documentAttributes:NULL error:NULL];
    
    self.layoutManager = [[NSLayoutManager alloc] init];
    [self.textStorage addLayoutManager:self.layoutManager];
    
}

@end



















