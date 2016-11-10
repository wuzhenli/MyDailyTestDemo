//
//  SecondToOne.m
//  多种测试
//
//  Created by kfz on 16/9/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SecondToOne.h"
#import "FromViewController.h"
#import "AniToViewController.h"


@implementation SecondToOne
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.25;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    FromViewController *toVC = (FromViewController *)nav.topViewController;
    AniToViewController *fromVC = (AniToViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *containerView = [transitionContext containerView];
    UIImageView *shotImgView = (UIImageView *)[fromVC.imgView snapshotViewAfterScreenUpdates:YES];
    shotImgView.frame = [containerView convertRect:fromVC.imgView.frame toView:fromVC.view];
    
    [containerView addSubview:nav.view];
    [containerView addSubview:shotImgView];

    //
    toVC.imgView.hidden = YES;
    NSTimeInterval interval = [self transitionDuration:nil];
    [UIView animateWithDuration:interval animations:^{
        shotImgView.frame = [toVC.imgView convertRect:toVC.imgView.frame toView:containerView];
    } completion:^(BOOL finished) {
        toVC.imgView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
    
}
@end















