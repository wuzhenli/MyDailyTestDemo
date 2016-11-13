//
//  LayoutViewController.m
//  多种测试
//
//  Created by kfz on 16/11/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "LayoutViewController.h"

@interface LayoutViewController ()
@property (weak, nonatomic) IBOutlet UILabel *redLabel;

@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLayout];
}

- (void)addLayout {
    UIView *v = self.redLabel;
    
    v.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1. constant:90];
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1. constant:50];
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1. constant:-50];
    NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1. constant:50];
    
    NSArray *constraints = @[constraintTop, constraintLeft, constraintRight, constraintHeight];
    [self.view addConstraints:constraints];
}


@end









