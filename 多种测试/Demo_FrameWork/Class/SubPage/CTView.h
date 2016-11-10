//
//  CTView.h
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"

@interface CTView : UIView<UIGestureRecognizerDelegate>

@property (strong, nonatomic) CoreTextData *data;

@end
