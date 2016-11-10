//
//  LayerViewController.m
//  多种测试
//
//  Created by kfz on 16/9/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "LayerViewController.h"
#import "MyLayer.h"
#import "NSString+ex.h"

@interface LayerViewController ()
@property (weak, nonatomic) CALayer *lay1;
@property (weak, nonatomic) MyLayer *lay2;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation LayerViewController

- (CALayer *)lay1 {
    if (!_lay1) {
        CALayer *lay = [CALayer layer];
        lay.backgroundColor = [UIColor yellowColor].CGColor;
        lay.frame = CGRectMake(10, 100, 100, 100);
        [self.view.layer addSublayer:lay];
        _lay1 = lay;
    }
    return _lay1;
}
- (MyLayer *)lay2 {
    if (!_lay2) {
        MyLayer *lay = [MyLayer layer];
//        lay.backgroundColor = [UIColor redColor].CGColor;
        lay.frame = CGRectMake(120, 100, 100, 100);
        [self.view.layer addSublayer:lay];
        _lay2 = lay;
    }
    return _lay2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lay1];
    [self lay2];
    
    MyLayer *lay = [[MyLayer alloc] initWithLayer:self.lay2];
    [self.view.layer addSublayer:lay];
    lay.backgroundColor = [UIColor orangeColor].CGColor;
    {
        NSString *str = @"aabbcc";
        NSString *sub = @"bdc";
        if ([str containsString:sub]) {
            NSLog(@"contain");
        } else {
            NSLog(@"not  contain");
        }
    }
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
