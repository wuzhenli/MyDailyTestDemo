//
//  ShapViewController.m
//  animation
//
//  Created by kfz on 2017/3/14.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ShapViewController.h"

@interface ShapViewController () {
    BOOL reverse;
}
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) CAShapeLayer *maskLayer;

@property (strong, nonatomic) CAShapeLayer *imgViewLayer;
@property (strong, nonatomic) UIBezierPath *shadowOriginPath;
@property (strong, nonatomic) UIBezierPath *shadowOffsetPath;

@property (strong, nonatomic) UIBezierPath *roundPath;
@property (strong, nonatomic) UIBezierPath *rectanglePath;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImgView;

@end

@implementation ShapViewController

- (CAShapeLayer *)imgViewLayer {
    if (_imgViewLayer) {
        _imgViewLayer = [CAShapeLayer layer];
        _imgViewLayer.bounds = self.shadowImgView.bounds;
    }
    return _imgViewLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, 200, 200);
    self.rectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
    self.roundPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:100];
    
    
    
    rect.origin = CGPointMake(100, 100);
    self.redView.frame = rect;
    self.maskLayer = [CAShapeLayer layer];
    self.maskLayer.path = self.rectanglePath.CGPath;
    
    self.redView.layer.mask = self.maskLayer;
    
//    CGRect imgFrame = self.shadowImgView.frame;
//    imgFrame.origin = CGPointMake(120, 330);
//    self.shadowImgView.frame = imgFrame;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.shadowImgView.layer.mask = self.imgViewLayer;
//    self.imgViewLayer.frame = self.shadowImgView.bounds;
//    // shadowPath
//    CGRect offsetFrame = self.shadowImgView.bounds;
//    offsetFrame.origin = CGPointMake(10, 10);
//    self.shadowOriginPath = [UIBezierPath bezierPathWithRect:self.shadowImgView.bounds];
//    self.shadowOffsetPath = [UIBezierPath bezierPathWithRect:offsetFrame];
    
    self.shadowImgView.layer.shadowOffset = CGSizeMake(10, 10);
    self.shadowImgView.layer.shadowOpacity = 1;
}

- (IBAction)startAnimation:(id)sender {
    
    [self.maskLayer removeAllAnimations];
    [self animationisReverse:reverse];
    [self shadowAnimationisReverse:reverse];
    reverse = YES;
    
}


- (void)shadowAnimationisReverse:(BOOL)isReverse {
    CGPathRef fromPath , toPath;
    if (isReverse) {
        fromPath = self.shadowOffsetPath.CGPath;
        toPath = self.shadowOriginPath.CGPath;
    } else {
        toPath = self.shadowOffsetPath.CGPath;
        fromPath = self.shadowOriginPath.CGPath;
    }
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
    animation.duration = 0.9;
    animation.fromValue = (__bridge id)fromPath;
    animation.toValue = (__bridge id)toPath;
    
    [self.imgViewLayer addAnimation:animation forKey:animation.keyPath];
}

- (void)animationisReverse:(BOOL)isReverse {
    CGPathRef fromPath, toPath;
    if (reverse) {
        fromPath = self.roundPath.CGPath;
        toPath = self.rectanglePath.CGPath;
    } else {
        toPath = self.roundPath.CGPath;
        fromPath = self.rectanglePath.CGPath;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    animation.duration = 1.;
    animation.speed = 1;
    animation.fromValue = (__bridge id)fromPath;
    animation.toValue = (__bridge id)toPath;
    
    [self.maskLayer addAnimation:animation forKey:animation.keyPath];
    self.maskLayer.path = toPath;
}




@end



































