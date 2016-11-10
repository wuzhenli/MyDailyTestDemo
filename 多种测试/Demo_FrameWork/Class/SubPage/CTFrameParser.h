//
//  CTFrameParser.h
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"

@interface CTFrameParser : NSObject

+ (NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config ;

+ (CoreTextData *)parseContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config;

+ (CoreTextData *)parseContentWithFilePath:(NSString *)path config:(CTFrameParserConfig *)config;

@end
