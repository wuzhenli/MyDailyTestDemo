//
//  LayerAnimationViewController.m
//  animation
//
//  Created by kfz on 2017/3/7.
//  Copyright © 2017年 kongfz. All rights reserved.
/*
    CALayer frame属性没有动画特性
    必须提供fromValue、 toValue
 */

#import "LayerAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>
// 104  157

static CGFloat const kImgViewWidth = 104;
static CGFloat const kImgViewHeight = 157;


@interface LayerAnimationViewController () {
    BOOL isAnimation;
}
@property (strong, nonatomic) CAShapeLayer *shapLayer; // 顶部暂停动画的layer
@property (strong, nonatomic) CAShapeLayer *redLabelLayer; //

@property (weak, nonatomic) IBOutlet UIImageView *topImgView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImgView;

@property (weak, nonatomic) IBOutlet UILabel *redLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation LayerAnimationViewController

- (CAShapeLayer *)shapLayer {
    if (!_shapLayer) {
        _shapLayer = [CAShapeLayer layer];
    }
    return _shapLayer;
}

- (CAShapeLayer *)redLabelLayer {
    if (!_redLabelLayer) {
        _redLabelLayer = [CAShapeLayer layer];
    }
    return _redLabelLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, kImgViewWidth, kImgViewHeight);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    self.shapLayer.path = path.CGPath;
    self.topImgView.layer.mask = self.shapLayer;

    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self setupRedLabelLayer];
}

- (void)setupRedLabelLayer {
    CGRect fromRect = CGRectMake(0, 0, 0, 30);
    self.redLabelLayer.path = [UIBezierPath bezierPathWithRect:fromRect].CGPath;
    self.redLabel.layer.mask = self.redLabelLayer;
}


- (void)testGetTime {
//    NSLog(@"%ld", time(nil));
//    NSLog(@"%lf", CFAbsoluteTimeGetCurrent());
//    NSLog(@"%lf", CACurrentMediaTime());
//
    NSLog(@"%lf", self.shapLayer.beginTime);
    NSLog(@"%lf", self.view.layer.beginTime);
}


- (IBAction)startAnimation:(id)sender {
    isAnimation = YES;
    CGRect fromRect = CGRectMake(0, 0, kImgViewWidth, kImgViewHeight);
    CGRect toRect = CGRectMake(0, 0, kImgViewWidth, 0);
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithRect:fromRect];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithRect:toRect];
    
    [self.shapLayer removeAllAnimations];
    self.shapLayer.speed = 1.;
    self.shapLayer.path = fromPath.CGPath;
    
//    self.shapLayer.beginTime = [self.shapLayer convertTime:CACurrentMediaTime() fromLayer:nil] - 2;
//    self.shapLayer.timeOffset = 1;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 5.;
    animation.speed = 1;
    animation.fromValue = (__bridge id _Nullable)(fromPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    
    [self.shapLayer addAnimation:animation forKey:animation.keyPath];
    self.shapLayer.path = toPath.CGPath;
}

- (IBAction)pauseAnimation:(id)sender {
    isAnimation = NO;
    CFTimeInterval currentTime = [self.shapLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.shapLayer.timeOffset = currentTime;
    self.shapLayer.speed = 0;
    
}

- (IBAction)resumeAnimation:(id)sender {
    if (isAnimation) {
        return;
    }
    isAnimation = YES;
    self.shapLayer.speed = 1.;
    CFTimeInterval timeOffset = self.shapLayer.timeOffset;
    self.shapLayer.timeOffset = 0;
    self.shapLayer.beginTime = 0;
    
    CFTimeInterval timeSincePause = [self.shapLayer convertTime:CACurrentMediaTime() fromLayer:nil] - timeOffset;
    self.shapLayer.beginTime = timeSincePause;
    
    
}

#pragma -mark
#pragma -mark layer动画
- (void)sliderValueChanged:(UISlider *)sender {
    static CGFloat oldValue = 0;
    CGFloat labelW = [UIScreen mainScreen].bounds.size.width - 20;
    
    CGRect fromRect = CGRectMake(0, 0, labelW * oldValue, 30);
    CGRect toRect = CGRectMake(0, 0, labelW * sender.value, 30);
    oldValue = sender.value;
    
    [self.redLabelLayer removeAllAnimations];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.3;
    animation.speed = 1;
    animation.fromValue = (id)[UIBezierPath bezierPathWithRect:fromRect].CGPath;
    animation.toValue   = (id)[UIBezierPath bezierPathWithRect:toRect].CGPath;

    [self.redLabelLayer addAnimation:animation forKey:animation.keyPath];
    self.redLabelLayer.path = [UIBezierPath bezierPathWithRect:toRect].CGPath;
    
}

@end






















