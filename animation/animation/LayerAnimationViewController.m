//
//  LayerAnimationViewController.m
//  animation
//
//  Created by kfz on 2017/3/7.
//  Copyright © 2017年 kongfz. All rights reserved.
/*
    CALayer frame属性没有动画特性
 */

#import "LayerAnimationViewController.h"

@interface LayerAnimationViewController ()
@property (strong, nonatomic) CALayer *shapLayer;
@property (weak, nonatomic) IBOutlet UIButton *greenView;


@end

@implementation LayerAnimationViewController

- (CALayer *)shapLayer {
    if (!_shapLayer) {
        _shapLayer = [CALayer layer];
        _shapLayer.frame = CGRectMake(0, 66, 100, 100);
        _shapLayer.position = CGPointMake(10, 70);
        _shapLayer.bounds = CGRectMake(0, 0, 100, 100);
        _shapLayer.backgroundColor = [UIColor redColor].CGColor;
    }
    return _shapLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.layer addSublayer:self.shapLayer];
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
    [self animation_1];
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

















