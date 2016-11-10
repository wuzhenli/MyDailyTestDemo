//
//  TipView.h
//  多种测试
//
//  Created by kfz on 16/6/5.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TipViewState ){
    TipViewStateNormal = 0,
    TipViewStateFaile = 1,
    TipViewStateSending = 2
};

@interface TipView : UIView

@property (assign, nonatomic) TipViewState state;

+ (instancetype)tipView ;

@end
