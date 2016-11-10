//
//  PastViewController.m
//  多种测试
//
//  Created by kfz on 16/9/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PastViewController.h"
#import "UICopyLabel.h"
#import "JSQMessagesCellTextView.h"

@interface PastViewController ()
@property (weak, nonatomic) IBOutlet JSQMessagesCellTextView *textView;

@end

@implementation PastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:UIMenuControllerDidShowMenuNotification object:nil];
}
- (void)test:(NSNotification *)notification {
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.textView.frame inView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
