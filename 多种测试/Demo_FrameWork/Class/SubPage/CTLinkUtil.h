//
//  CTLinkUtil.h
//  多种测试
//
//  Created by kfz on 16/8/27.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextLineData.h"
#import "CoreTextData.h"
#import <UIKit/UIKit.h>

@interface CTLinkUtil : NSObject

+ (CoreTextLineData *)touchLinkInView:(UIView *)view atPoint:(CGPoint)point data:(CoreTextData *)data ;

@end
