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
@property (weak, nonatomic) IBOutlet UIImageView *ballView;

@end

@implementation TimeingFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.layerView];
    self.containerView.hidden = YES;
    
   
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self animate];
}

#pragma -mark
#pragma -mark 自定义 TimingFunction 
- (void)defineTimingFunction {
    CAMediaTimingFunction *func = [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];
    [self timingWithTimeingFunction:func];
}

- (void)timingWithTimeingFunction:(CAMediaTimingFunction *)function {
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

- (void)defineMediaTiming {
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self timingWithTimeingFunction:function];
}

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [UIView new];
        _layerView.frame = CGRectMake(10, 100, 200, 200);
        _layerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _layerView;
}

#pragma -mark
#pragma -mark 流程自动化
float interpolate(float from, float to, float time)
{
    return (to - from) * time + from;
}
- (id)interpolateFromValue:(id)fromValue toValue:(id)toValue time:(float)time {
    if ([fromValue isKindOfClass:[NSValue class]]) {
        //get type
        const char *type = [fromValue objCType];
        if (strcmp(type, @encode(CGPoint)) == 0) {
            CGPoint from = [fromValue CGPointValue];
            CGPoint to = [toValue CGPointValue];
            CGPoint result = CGPointMake(interpolate(from.x, to.x, time), interpolate(from.y, to.y, time));
            return [NSValue valueWithCGPoint:result];
                                                                                      
                                                                                      
        }
    }
                                                                                      //provide safe default implementation
    return (time < 0.5)? fromValue: toValue;
}
- (void)animate {
  //reset ball to top of screen
  self.ballView.center = CGPointMake(150, 32);
  //set up animation parameters
  NSValue *fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 32)];
    NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(150, 268)];
    CFTimeInterval duration = 1.0;
  //generate keyframes
  NSInteger numFrames = duration * 60;
  NSMutableArray *frames = [NSMutableArray array];
  for (int i = 0; i < numFrames; i++) {
      float time = 1 / (float)numFrames * i;
      [frames addObject:[self interpolateFromValue:fromValue toValue:toValue time:time]]; }
  //create keyframe animation
  CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
  animation.keyPath = @"position";
  animation.duration = 1.0;
  animation.delegate = self;
  animation.values = frames;
  //apply animation
  [self.ballView.layer addAnimation:animation forKey:nil];
}
@end




























