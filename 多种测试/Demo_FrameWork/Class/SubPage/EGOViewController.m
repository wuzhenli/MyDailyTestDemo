//
//  EGOViewController.m
//  多种测试
//
//  Created by kfz on 16/7/22.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "EGOViewController.h"
#import <EGORefreshTableHeaderView.h>


@interface EGOViewController ()<UITableViewDelegate, UITableViewDataSource, EGORefreshTableHeaderDelegate>

@property (strong, nonatomic) EGORefreshTableHeaderView *refreshHeaderView;
@property (assign, nonatomic) BOOL reloading;

@property (weak, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *ds;

@end

static NSString *ID = @"cell ID";

@implementation EGOViewController

- (UITableView *)tableView {
    if (!_tableView) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,size.width , size.height) style:UITableViewStylePlain];
        [self.view addSubview:tv];
        _tableView = tv;
    }
    return _tableView;
}

- (NSMutableArray *)ds {
    if(!_ds) {
        NSMutableArray *array = [NSMutableArray array];
        _ds = array;
    }
    return _ds;
}
- (void)add_10_data {
    static int num = 0;
    for (int i=0; i<10; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",num ++];
        [self.ds addObject:str];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO
    [self add_10_data];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView.delegate  = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    self.refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, -size.height, size.width, size.height)];
    [self.tableView addSubview:self.refreshHeaderView];
    self.refreshHeaderView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [self.ds objectAtIndex:indexPath.row];
    if (indexPath.row > self.ds.count - 1) {
        
    }
    return cell;
}

#pragma -mark EGO delegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view {
    [self reloadTableViewDataSource];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.4];
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view {
    return _reloading;
}
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view {
    return [NSDate date];
}

#pragma -mark UIScrollVeiw delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}
// -----------
- (void)reloadTableViewDataSource {
    _reloading = YES;
    [self add_10_data];
}

- (void)doneLoadingTableViewData {
    _reloading = NO;
    [self.tableView reloadData];
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}
@end














