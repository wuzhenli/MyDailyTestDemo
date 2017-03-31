//
//  BaseViewController.m
//  PageVeiwController_Test
//
//  Created by kfz on 2017/3/31.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bottomLab;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _bottomLab.text = [NSString stringWithFormat:@"%lu", _index];
}

- (void)setIndex:(NSUInteger)index {
    _index = index;
    _bottomLab.text = [NSString stringWithFormat:@"%lu", index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
