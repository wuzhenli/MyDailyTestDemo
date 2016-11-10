//
//  CoreTextData.h
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Coretext/CoreText.h>
#import "CoreTextImageData.h"
#import "CoreTextLineData.h"


@interface CoreTextData : NSObject

@property (assign, nonatomic) CTFrameRef ctFrame;
@property (assign, nonatomic) CGFloat height;

@property (strong, nonatomic) NSMutableArray<CoreTextImageData *> *imageArray;

@property (strong, nonatomic) NSMutableArray<CoreTextLineData *> *linkArray;

@end
