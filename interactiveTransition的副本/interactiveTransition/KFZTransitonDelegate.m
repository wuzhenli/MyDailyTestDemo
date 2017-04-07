//
//  KFZTransitonDelegate.m
//  CoreAnimationTest
//
//  Created by kfz on 2017/2/24.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KFZTransitonDelegate.h"
#import "KFZTransitionAnimation.h"
#import "SwipeUpInteractiveTransition.h"


@interface KFZTransitonDelegate ()

@property (strong, nonatomic) KFZTransitionAnimation *transitionAnimation;

@property (strong, nonatomic) SwipeUpInteractiveTransition *interactiveTransition;

@property (weak, nonatomic) UIViewController *presentedVC;

@end

@implementation KFZTransitonDelegate

- (instancetype)initWithPresentedVC:(UIViewController *)presentedVC {
    NSAssert(presentedVC, @"presentedVC must not be nil");
    if (self == [super init]) {
        _transitionAnimation = [KFZTransitionAnimation new];
        _interactiveTransition = [SwipeUpInteractiveTransition new];
        self.presentedVC = presentedVC;
    }
    return self;
}

- (instancetype) init {
    NSLog(@"Use \"initWithPresentedVC\" to create instance.");
    return [self initWithPresentedVC:nil];
}


- (void)setPresentedVC:(UIViewController *)presentedVC {
    _presentedVC = presentedVC;
    [self.interactiveTransition wireToViewController:presentedVC];
}


#pragma -mark
#pragma -mark UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.transitionAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.transitionAnimation;
}

/** 交互式动画 */
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    if (self.interactiveTransition.interacting) {
        return self.interactiveTransition;

    }
    return nil;
}





@end
