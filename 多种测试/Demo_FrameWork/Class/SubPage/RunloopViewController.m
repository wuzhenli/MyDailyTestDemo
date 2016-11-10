//
//  RunloopViewController.m
//  多种测试
//
//  Created by kfz on 16/8/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()<UITableViewDataSource, UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tv;

@property (strong, nonatomic) IBOutlet UIView *cellView;

@property (strong, nonatomic) NSTimer *timer;
@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellView.tag = 12;
    [self performSelector:@selector(touchesBegan) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
    [self createTimer];
}

- (void)createTimer {
    self.timer = [NSTimer timerWithTimeInterval:1. target:self selector:@selector(print) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)print {
    NSLog(@"%@",@"909090");
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kdeoo_cell"];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kdeoo_cell"];
    }
    UIView *v = [cell.contentView viewWithTag:12];
    if (v == nil) {
        [cell.contentView addSubview:self.cellView];
    }
    return cell;
}

- (void)touchesBegan{
    self.label.text = @"123";
//    self.tv update
}



@end















