//
//  UIViewViewController.m
//  多种测试
//
//  Created by kfz on 16/8/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "UIViewViewController.h"
#import "MyView.h"
#import "MyButton.h"
#import "LayerViewController.h"


@interface UIViewViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation UIViewViewController
static NSString *ID = @"reuse_cell";

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ( [super initWithNibName:@"UIViewViewController" bundle:nibBundleOrNil] ) {
        ;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testLayout];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    {
        UIView *view = [self.label snapshotViewAfterScreenUpdates:NO];
        
        [self.view addSubview:view];
        CGRect frame = self.label.frame;
        frame.origin.y += 10;
        view.frame = frame;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 200;
//}


- (void)testLayout {
    UIView *redV = [[UIView alloc] initWithFrame:CGRectMake(20, 90, 200, 200)];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    UIView *yelV = [[UIView alloc] init];
    yelV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    yelV.frame = CGRectInset(redV.bounds, 10, 20);
    NSLog(@"%@", NSStringFromCGRect(yelV.frame));
    yelV.backgroundColor = [UIColor yellowColor];
    [redV addSubview:yelV];
}




- (void)testEmotion {
    UIInterpolatingMotionEffect *shadowEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.shadowOffset" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    shadowEffect.minimumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
    
    shadowEffect.maximumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
//    
//    [self.redView addMotionEffect:shadowEffect];
//    [self registerEffectForView:self.redView depth:120];
}


#pragma mark - Private Method
- (void)registerEffectForView:(UIView *)aView depth:(CGFloat)depth;
{
    UIInterpolatingMotionEffect *effectX;
    UIInterpolatingMotionEffect *effectY;
    
    effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    effectX.maximumRelativeValue = @(-depth);
    effectX.minimumRelativeValue = @(depth);
    effectY.maximumRelativeValue = @(-depth);
    effectY.minimumRelativeValue = @(depth);
    
    [aView addMotionEffect:effectX];
    [aView addMotionEffect:effectY];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}



@end






