//
//  BViewController.m
//  interactiveTransition
//
//  Created by kfz on 2017/2/24.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "BViewController.h"
#import "KFZTransitonDelegate.h"


@interface BViewController ()
@property (strong, nonatomic) KFZTransitonDelegate *kfzTransitionDelegate;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.kfzTransitionDelegate = [[KFZTransitonDelegate alloc] initWithPresentedVC:self];
    self.transitioningDelegate = self.kfzTransitionDelegate;
    
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
