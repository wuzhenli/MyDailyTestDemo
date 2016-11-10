//
//  DFontViewController.h
//  多种测试
//
//  Created by kfz on 16/7/7.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFontViewController : UIViewController

@property (strong, nonatomic) NSArray *fontNames;
@property (strong, nonatomic) NSArray *fontSamples;
@property (weak, nonatomic) IBOutlet UITableView *fTableView;
@property (weak, nonatomic) IBOutlet UITextView *fTextView;
@property (weak, nonatomic) IBOutlet UIProgressView *fProgressView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *fActivityIndicatorView;

@end
