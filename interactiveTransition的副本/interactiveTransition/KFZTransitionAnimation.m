//
//  PresentAnimation.m
//  CoreAnimationTest
//
//  Created by kfz on 17/2/15.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KFZTransitionAnimation.h"



@implementation KFZTransitionAnimation


// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerV = [transitionContext containerView];
    
//    UITransitionContextToViewControllerKey
    //   UITransitionContextFromViewControllerKey
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
   
    // 判断
    BOOL isPresenting = NO;
    if (fromVC.presentedViewController == toVC) {
        isPresenting = YES;
    }
    
    if ([containerV.subviews containsObject:toVC.view] == NO) {
        NSLog(@"[containerV addSubview:toVC.view];");
        [containerV addSubview:toVC.view];
    }
    

    NSTimeInterval time = [self transitionDuration:transitionContext];
    if (isPresenting) { // presenting
        UIView *toView = toVC.view;
        CGRect finallFrame = [transitionContext finalFrameForViewController:toVC];
        finallFrame.origin = CGPointZero;
        toView.frame = CGRectMake(CGRectGetWidth(finallFrame), 0, CGRectGetWidth(finallFrame), CGRectGetHeight(finallFrame));
        [UIView animateWithDuration:time animations:^{
            toView.frame = finallFrame;
        } completion:^(BOOL finished) {
            BOOL cancelled = [transitionContext transitionWasCancelled];
            
            [transitionContext completeTransition:!cancelled];
        }];
    } else {            // dismiss
        [containerV sendSubviewToBack:toVC.view];
        
        UIView *fromView = fromVC.view;
        
        CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
        fromView.frame = finalFrame;
        
        finalFrame.origin.x = finalFrame.size.width;
        
        [UIView animateWithDuration:time animations:^{
            fromView.frame = finalFrame;
        } completion:^(BOOL finished) {
            BOOL cancelled = [transitionContext transitionWasCancelled];
            if ( !cancelled ) {
                [fromVC.view removeFromSuperview];
            }
            [transitionContext completeTransition:!cancelled];
        }];
    }
    
}




@end

















