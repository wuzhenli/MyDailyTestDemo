//
//  CTView.m
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CTView.h"
#import <CoreText/CoreText.h>
#import "CTLinkUtil.h"


@implementation CTView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1., -1.);
    if ( self.data ) {
        CTFrameDraw(self.data.ctFrame, context);
    }
    
    for ( CoreTextImageData *imageData in self.data.imageArray ) {
        UIImage *image = [UIImage imageNamed:imageData.name];
        CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
    }
    
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addTapEvent];
    }
    return self;
}
- (void)addTapEvent {
    UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapGesture:)];
    tapRecognizer.delegate = self;
    [self addGestureRecognizer:tapRecognizer];
    self.userInteractionEnabled = YES;
}

- (void)userTapGesture:(UIGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self];
    
    CoreTextLineData *lineData = [CTLinkUtil touchLinkInView:self atPoint:point data:self.data];
    if (lineData) {
        NSLog(@"%@", lineData.url);
        return;
    }
    
    for (CoreTextImageData *imageData in self.data.imageArray) {
        CGRect imageRect = imageData.imagePosition;
        imageRect.origin.y = self.height - imageRect.origin.y - imageRect.size.height;
        if (CGRectContainsPoint(imageRect, point)) {
            NSLog(@"%@", imageData.name);
            break;
        }
    }
}




- (void)simpleTest {
    // 1
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1., -1.);
    // 3
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    // 4
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"hello world" attributes:nil];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, NULL);
    // 5
    CTFrameDraw(frame, context);
    // 6
    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(path);
}

@end













