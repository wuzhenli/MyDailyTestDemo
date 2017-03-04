//
//  ViewController.h
//  defineCamera
//
//  Created by kfz on 2017/3/2.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KFZBaseCameraVC;
@protocol KFZBaseCameraVCDelegate <NSObject>

@required
- (void)KFZBaseCameraVC:(KFZBaseCameraVC *)vc takeImageData:(NSData *)data;

@end

@interface KFZBaseCameraVC : UIViewController

- (instancetype)initWithDelegate:(id<KFZBaseCameraVCDelegate>)delegate ;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end

