//
//  KFZTransitonDelegate.h
//  CoreAnimationTest
//
//  Created by kfz on 2017/2/24.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KFZTransitonDelegate : NSObject<UIViewControllerTransitioningDelegate>

- (instancetype)initWithPresentedVC:(UIViewController *)presentedVC ;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end
