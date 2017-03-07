//
//  AAViewController.m
//  多种测试
//
//  Created by kfz on 16/8/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AAViewController.h"
#import "NSDate+compare.h"
#import "RegexKitLite.h"
#import "MyTextView.h"
#import "SigalTest.h"
#import "NotificationTool.h"
#import "UIImage+extension.h"
#import "NSString+extension.h"
#import "BBViewController.h"

#import <WebKit/WebKit.h>
#import <objc/runtime.h>

#define TEST

#define SERVERNAMETEST  @""

@interface AAViewController ()<UITextViewDelegate>
@property (strong, nonatomic) CALayer *layer;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end

@implementation AAViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:@"AAViewController" bundle:nibBundleOrNil]) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testLayer;
}




- (void)testLayer {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 100, 375, 225);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    layer.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    UIImage *image = [UIImage imageNamed:@"banner"];
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAShapeLayer *layer = [CAShapeLayer layer];
    [self.topLabel.layer addSublayer:layer];
//    layer.frame = self.topLabel.bounds;
    layer.backgroundColor = [UIColor clearColor].CGColor;

    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.topLabel.bounds];
    layer.path = path.CGPath;
    
    
    layer.strokeStart = 0.0;
    layer.strokeEnd = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        layer.strokeEnd = 0.7;
    }];
}




@end





















