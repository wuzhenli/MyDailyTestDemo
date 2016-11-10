//
//  HeightTableViewController.m
//  多种测试
//
//  Created by kfz on 16/9/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "HeightTableViewController.h"
#import "HeightTableViewCell.h"


@interface HeightTableViewController ()
@property (strong, nonatomic) NSMutableArray<NSString *> *ds;
@end

@implementation HeightTableViewController

- (NSMutableArray<NSString *> *)ds {
    if (!_ds) {
        _ds = [NSMutableArray arrayWithCapacity:20];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"下面来看一下约束，这个是决定你的cell能否自适应的关键"
         "UIImageView约束如下"
         "左边距离contentView左边15"
         "顶部距离contentView顶部8"
         "width 和 height为 40"];
        [_ds addObject:@"这里主要使用systemLayoutSizeFittingSize:来获取内容的高度，所以在获取高度之前我们必须有一个实例化的cell。我"
         "  在这里使用字典存储cell，主要是因为一个tableView中可能有多种不同的cell。获取到cell之后将内容添加上去，然后更新约束。"
         "文／huluobobo（简书作者）"
         "原文链接：http://www.jianshu.com/p/bbe8094e147d"
         "著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。"];
//        
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
        [_ds addObject:@"self.tableView.estimatedRowHeight = 60;"];
    }
    return _ds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        
    }
    
    
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    UINib *nib = [UINib nibWithNibName:@"HeightTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"height_cell"];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"height_cell" forIndexPath:indexPath];
    cell.text = self.ds[indexPath.row];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

@end
