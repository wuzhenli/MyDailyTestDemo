//
//  ViewController.m
//  interactiveTransition
//
//  Created by kfz on 2017/2/24.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
#import "KFZTransitionAnimation.h"
#import "SwipeUpInteractiveTransition.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)presentVC:(id)sender {
    BViewController *bVC = [[BViewController alloc] init];
    
    
    [self presentViewController:bVC animated:YES completion:nil];
}

//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    return self.transitionAnimation;
//}
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
//    return self.transitionAnimation;
////    return [NormalDismissAnimation new];
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
//}




@end














