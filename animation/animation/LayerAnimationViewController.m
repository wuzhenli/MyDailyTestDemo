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
#import <QuartzCore/QuartzCore.h>b


@interface LayerAnimationViewController ()
@property (strong, nonatomic) CAShapeLayer *shapLayer;
@property (weak, nonatomic) IBOutlet UIButton *greenView;

@property (weak, nonatomic) IBOutlet UILabel *redLabel;

@end

@implementation LayerAnimationViewController

- (CAShapeLayer *)shapLayer {
    if (!_shapLayer) {
        _shapLayer = [CAShapeLayer layer];
        _shapLayer.frame = CGRectMake(0, 66, 100, 100);
        _shapLayer.position = CGPointMake(10, 70);
        _shapLayer.bounds = CGRectMake(0, 0, 100, 100);
        _shapLayer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    return _shapLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.shapLayer.frame = self.redLabel.bounds;
    [self.redLabel.layer addSublayer:self.shapLayer];
}

- (IBAction)greenViewClicked:(id)sender {
    
    CGRect beginRect = CGRectMake(0, 66, 100, 100);
    CGRect endRect = CGRectMake(100, 166, 200, 200);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"frame"];
    animation.duration = 1.;
    animation.fromValue = [NSValue valueWithCGRect:beginRect];
    animation.toValue = [NSValue valueWithCGRect:endRect];
    
    
    [self.greenView.layer addAnimation:animation forKey:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self textProgressAnimation];
}


- (void)textProgressAnimation {
    
}

- (void)animation_3 {
    CAShapeLayer *layer = self.shapLayer;
    
    layer.fillColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor greenColor].CGColor;
    
    CGRect rect = CGRectMake(20, 20, 200, 200);
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 200, 300, 200)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 2.;
//    animation.fillMode = kCAFillModeForwards;
    
//    animation.removedOnCompletion = YES;
    animation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    
    [layer addAnimation:animation forKey:nil];
}

- (void)animation_2 {
    [CATransaction begin];
    [CATransaction setDisableActions:NO]; // NO有动画，YES：关闭动画
    [CATransaction setAnimationDuration:1];
    self.shapLayer.position = CGPointMake(300, 300);
    [CATransaction commit];
}

- (void)animation_1 {
    CGRect beginRect = CGRectMake(0, 66, 100, 100);
    CGRect endRect = CGRectMake(100, 166, 200, 200);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(10, 70)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
    
    [self.shapLayer addAnimation:animation forKey:nil];
}

@end

















