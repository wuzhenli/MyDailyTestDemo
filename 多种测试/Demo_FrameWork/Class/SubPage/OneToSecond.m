//
//  OneToSecond.m
//  多种测试
//
//  Created by kfz on 16/9/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "OneToSecond.h"
#import "FromViewController.h"
#import "AniToViewController.h"

@implementation OneToSecond

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FromViewController *fromVC = (FromViewController *)nav.topViewController;
    AniToViewController *toVC = (AniToViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *containerView = [transitionContext containerView];
    
    // fromVC 中的imgView的截图
    UIImageView *shotImgView = (UIImageView *)[fromVC.imgView snapshotViewAfterScreenUpdates:YES];
    CGRect toFrame = [containerView convertRect:fromVC.imgView.frame fromView:fromVC.containerView];
    shotImgView.frame = toFrame;
    
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:shotImgView];
    
    //
    toVC.imgView.hidden = YES;
    
    NSTimeInterval interval = [self transitionDuration:nil];
    [UIView animateWithDuration:interval animations:^{
        shotImgView.frame = [containerView convertRect:toVC.imgView.frame fromView:toVC.view];
    } completion:^(BOOL finished) {
        toVC.imgView.hidden = NO;
        [shotImgView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end



















