//
//  AnimationViewController.m
//  多种测试
//
//  Created by kfz on 16/8/23.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
// layer层动画
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UISlider *animationSlider;
@property (weak, nonatomic) IBOutlet UIView *squareView;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(input:) name:UITextFieldTextDidChangeNotification object:self.inputTextField];
    
    [self initProgressAnimation];
}
#pragma -mark 进度条 动画
- (void)initProgressAnimation {
    self.animationSlider.value = 0.;
    [self.animationSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
}
- (void)sliderChanged:(UISlider *)sender {
    CGFloat v = sender.value;
    CGFloat layerWidth = self.animationView.frame.size.width * v;
    CGFloat layerHeight = self.animationView.frame.size.height;
    
    static CAShapeLayer *layer = nil;
    if (layer == nil) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)].CGPath;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.lineWidth = 5;
        layer.strokeStart = 0;
        [self.squareView.layer addSublayer:layer];
    } 
    layer.strokeEnd = v;
    
    
    /*
    if (!self.animationView.layer.mask) {
        layer = [CAShapeLayer layer]; 
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, layerWidth, layerHeight)].CGPath;
        layer.path = path;
        layer.fillColor = [UIColor redColor].CGColor;
        self.animationView.layer.mask = layer;
    } else {
        
        
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, layerWidth, layerHeight)].CGPath;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.fromValue = (__bridge  id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.duration = 0.2;
        animation.removedOnCompletion = NO;
        [layer addAnimation:animation forKey:nil];
        
        layer.path = path;
    }
     */
}


- (void)input:(NSNotification *)noti {
    static CAShapeLayer *layer = nil;
    
    CGSize btnSize = self.loginBtn.frame.size;
    CGFloat x = btnSize.width * (self.inputTextField.text.length / 11.);
    
    if (!self.loginBtn.layer.mask) {
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, x, btnSize.height)].CGPath;
        layer = [CAShapeLayer layer];
        layer.fillColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
        layer.path = path;
        self.loginBtn.layer.mask = layer;
        
    } else {
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, x, btnSize.height)].CGPath;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.fromValue = (__bridge id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.duration = 0.2;
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        
        layer.path = path;
    }
    
    

//    layer.strokeColor = [UIColor blackColor].CGColor;
//    
//    layer.path = path;
//    
//    self.loginBtn.layer.mask = layer;
    
}

- (IBAction)springAnimation:(id)sender {
    UIButton *bgView = [[UIButton alloc] initWithFrame:self.view.bounds];
    bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [bgView addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bgView];
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 1, 1)];
        imgView.image = [UIImage imageNamed:@"QQ"];
        [bgView addSubview:imgView];
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            imgView.bounds = CGRectMake(0, 0, 120, 120);
        } completion:^(BOOL finished) {
            ;
        }];
    }
    
}
- (void)animation {
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end














