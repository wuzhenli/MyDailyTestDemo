//
//  TimeingFuncViewController.m
//  animation
//
//  Created by kfz on 2017/4/26.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "TimeingFuncViewController.h"

@interface TimeingFuncViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) UIView *layerView;

@end

@implementation TimeingFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.layerView];
    self.containerView.hidden = YES;
    
    [self defineMediaTiming];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


- (void)defineMediaTiming {
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // get controlPoint
    float f1[2] = {0}, f2[2] = {0};
    [function getControlPointAtIndex:1 values:f1];
    [function getControlPointAtIndex:2 values:f2];
    
    CGPoint controlPoint1 = {f1[0], f1[1]};
    CGPoint controlPoint2 = {f2[0], f2[1]};
    // create curve
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    // create layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 4;
    layer.path = path.CGPath;
    [self.layerView.layer addSublayer:layer];
    // self
    self.layerView.layer.geometryFlipped = YES;
    
}

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [UIView new];
        _layerView.frame = CGRectMake(10, 100, 200, 200);
        _layerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _layerView;
}
@end




























