//
//  KVO_ViewController.m
//  多种测试
//
//  Created by kfz on 16/6/5.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "KVO_ViewController.h"
#import "TipView.h"

@interface KVO_ViewController ()
@property (weak, nonatomic) TipView *tipView;
@end

@implementation KVO_ViewController

- (TipView *)tipView {
    if (!_tipView) {
        TipView *tv = [TipView tipView];
        [self.view addSubview:tv];
        _tipView = tv;
        _tipView.frame = (CGRect){{30, 50}, {200, 50}};
    }
    return _tipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipView.state = TipViewStateNormal;
}

- (IBAction)buttonClicked:(UIButton *)sender {
    NSInteger num = [self.view.subviews indexOfObject:sender];
    self.tipView.state = num;
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
