//
//  ResponderChainViewController.m
//  多种测试
//
//  Created by kfz on 16/6/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ResponderChainViewController.h"

@interface ResponderChainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ResponderChainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"%@",self.button.nextResponder);
//    NSLog(@"%@",self.button.nextResponder.nextResponder);
    NSLog(@"%@",self.button.nextResponder.nextResponder.nextResponder);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.button.nextResponder.nextResponder.nextResponder);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"%@",self.button.nextResponder.nextResponder.nextResponder);
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














