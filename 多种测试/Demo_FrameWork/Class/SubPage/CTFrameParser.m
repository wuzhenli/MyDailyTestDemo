//
//  CTFrameParser.m
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CTFrameParser.h"
#import "CoreTextImageData.h"

@implementation CTFrameParser

+ (NSDictionary *)attributesWithConfig:(CTFrameParserConfig *)config {
    CGFloat fontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberOfSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing},
        { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpacing }
    };
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    UIColor *textColor = config.textColor;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);
    
    return dict;
}

+ (CoreTextData *)parseContentWithFilePath:(NSString *)path config:(CTFrameParserConfig *)config {
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *linkArray = [NSMutableArray array];
    // 构建属性字符串
    NSAttributedString *attString = [self createAttributeStringWithPath:path config:config imageArray:imageArray linkArray:linkArray];
    CoreTextData *data = [self parseContent:attString config:config];
    data.imageArray = imageArray;
    data.linkArray = linkArray;
    return data;
}

+ (NSMutableAttributedString *)createAttributeStringWithPath:(NSString *)path config:(CTFrameParserConfig *)config imageArray:(NSMutableArray *)imageArray linkArray:(NSMutableArray *)linkArray {
    NSDictionary *attsDic = [self attributesWithConfig:config];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSMutableAttributedString *attSringM = [[NSMutableAttributedString alloc] init];
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ( [array isKindOfClass:[NSArray class]]) {
        for (NSDictionary *contentDic in array) {
            NSAttributedString *subAttStr = [self attributedStringWithContentDic:contentDic attributed:attsDic imageArray:imageArray linkArray:linkArray position:attSringM.length];
            [attSringM appendAttributedString:subAttStr];
        }
    }
    return attSringM;
}

+ (NSAttributedString *)attributedStringWithContentDic:(NSDictionary *)contentDic attributed:(NSDictionary *)attDic imageArray:(NSMutableArray *)imageArray linkArray:(NSMutableArray *)linkArray  position:(NSUInteger)position {
    NSAttributedString *attStr = nil;
    NSString *type = contentDic[@"type"];
    if ([type isEqualToString:@"txt"]) {
        attStr = [self getAttributedStringWithContentDic:contentDic attributed:attDic];
    }
    else if ([type isEqualToString:@"img"]) {
        CoreTextImageData *imageData = [[CoreTextImageData alloc] init];
        imageData.name = contentDic[@"name"];
        imageData.position = position;
        [imageArray addObject:imageData];
        // 创建空白占位符
        attStr = [self parseImageDataFromNSDictionary:contentDic baseAttributes:attDic];
    } else if ([type isEqualToString:@"link"] ) {
        attStr = [self getAttributedStringWithContentDic:contentDic attributed:attDic];
        NSString *title = contentDic[@"content"];
        NSRange range = NSMakeRange(position, title.length);
        CoreTextLineData *linkData = [[CoreTextLineData alloc] initWithTitle:title url:contentDic[@"url"] range:range];
        [linkArray addObject:linkData];
    }
    return attStr;
}
/*
 { "color" : "blue",
 "content" : " 这是链接 ",
 "size" : 22,
 "type" : "link",
 "url"  : "http://www.baidu.com"
 },
 */

+ (NSAttributedString *)getAttributedStringWithContentDic:(NSDictionary *)contentDic attributed:(NSDictionary *)attDictionary {
    NSAttributedString *attStr = nil;
    NSMutableDictionary *attDic = [[NSMutableDictionary alloc] initWithDictionary:attDictionary];
    UIColor *color = [self getColorWithDic:contentDic];
    if (color) {
        attDic[(id)kCTForegroundColorAttributeName] = (id)color.CGColor;
    }
    if (contentDic[@"size"]) {
        CGFloat fontSize = [contentDic[@"size"] floatValue];
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
        attDic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    }
    attStr = [[NSAttributedString alloc] initWithString:contentDic[@"content"] attributes:attDic];
    return attStr;
}

static CGFloat ascentCallback(void *ref) {
    return [(NSNumber *)[(__bridge NSDictionary*)ref objectForKey:@"height"] floatValue];
}
static CGFloat descentCallback(void *ref) {
    return 0;
}
static CGFloat widthcallback(void *ref) {
    return [(NSNumber*)[(__bridge NSDictionary*)ref objectForKey:@"width"] floatValue];
}
+ (NSAttributedString *)parseImageDataFromNSDictionary:(NSDictionary *)dict baseAttributes:(NSDictionary *)baseAttributes {
    CTRunDelegateCallbacks callbacks;
    memset(&callbacks, 0, sizeof(CTRunDelegateCallbacks));
    callbacks.version = kCTRunDelegateVersion1;
    callbacks.getAscent = ascentCallback;
    callbacks.getDescent = descentCallback;
    callbacks.getWidth = widthcallback;
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, (__bridge void *)(dict));
    
    // 占位符
    unichar replaceChar = 0xFFFC;
    NSString *content = [NSString stringWithCharacters:&replaceChar length:1];
    NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:content attributes:baseAttributes];
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)space, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);
    CFRelease(delegate);
    
    return space;
}



+ (UIColor *)getColorWithDic:(NSDictionary *)dic {
    // black  red   blue
    UIColor *color = nil;
    NSString *colorStr = dic[@"color"];
    
    if ( [colorStr isEqualToString:@"black"] ) {
        color = [UIColor blackColor];
    }else if ([colorStr isEqualToString:@"red"] ) {
        color = [UIColor redColor];
    }else if ([colorStr isEqualToString:@"blue"] ) {
        color = [UIColor blueColor];
    }
    return color;
}


+ (CoreTextData *)parseContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config {
//    NSDictionary *attributes = [self attributesWithConfig:config];
    NSAttributedString *contentString = content;
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
    CGSize restrictSie = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSie, nil);
    CGFloat textHeight = coreTextSize.height;
    //
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHeight];
    CoreTextData *data = [[CoreTextData alloc] init];
    data.ctFrame = frame;
    data.height = textHeight;
    
    CFRelease(frame);
    CFRelease(framesetter);
    
    return data;
}
+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter config:(CTFrameParserConfig *)config height:(CGFloat)height {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.width, height) );
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}

@end









