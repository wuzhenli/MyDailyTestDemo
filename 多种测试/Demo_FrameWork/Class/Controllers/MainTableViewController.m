//
//  MainTableViewController.m
//  Demo_FrameWork
//
//  Created by kfz on 16/6/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//  主页

#import "MainTableViewController.h"
#import "KVO_ViewController.h"
#import "AAViewController.h"

@interface MainTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray *classArray;
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation MainTableViewController

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)classArray {
    if (!_classArray) {
        _classArray = [NSMutableArray array];
    }
    return _classArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTable];
    
    [self addItem:@"深拷贝" class:@"DepyCopyViewController"];  // DepyCopyViewController
    [self addItem:@"ArchiveViewController" class:@"ArchiveViewController"];  //
    [self addItem:@"设置图片圆角" class:@"CornerRadiousViewController"];  //
    [self addItem:@"显示网页" class:@"WebVC"];  //
    [self addItem:@"使用相机📷 " class:@"CameraViewController"];  //
    [self addItem:@"UI测试" class:@"UITestViewController"];  //
    [self addItem:@"孔网商品详情界面 " class:@"KFZProductViewController"];  //
    [self addItem:@"输入手机号码动画" class:@"AnimationViewController"];  //
    [self addItem:@"转场动画" class:@"FromViewController"];  //
    [self addItem:@"api测试" class:@"UIViewViewController"];  //
    [self addItem:@"GCD" class:@"GCDViewController"]; //
    [self addItem:@"文件 测试" class:@"FileViewController"]; // FileViewController
    [self addItem:@"用数据库保存图片" class:@"SqlImageViewController"]; //
    [self addItem:@"数值--修改界面（KVO）" class:@"KVO_ViewController"]; //
    [self addItem:@"控件的Scale动画" class:@"ButtonScaleViewController"];  //
    [self addItem:@"响应者链" class:@"ResponderChainViewController"];  //
    [self addItem:@"密码输入不清空" class:@"PswViewController"];  //
    [self addItem:@"计算时差" class:@"CalenderViewController"];  //
    [self addItem:@"集合视图添加headView" class:@"ColViewController"];  //
    [self addItem:@"download font" class:@"DFontViewController"];  //
    [self addItem:@"NSScanner" class:@"NClassViewController"];  //
    [self addItem:@"EGO刷新" class:@"EGOViewController"];  //
    [self addItem:@"CoreFoundation" class:@"CFViewController"];  //
    [self addItem:@"CoreTextViewController" class:@"CoreTextViewController"];  //
    
    [self addItem:@"RunloopViewController" class:@"RunloopViewController"];  //
    [self addItem:@"TextKitViewController" class:@"TextKitViewController"];  //
    [self addItem:@"测试  测试   测试" class:@"AAViewController"];  //
    [self addItem:@"iOS Tips" class:@"TipsViewController"];  //
    [self addItem:@"复制 粘贴 功能" class:@"PastViewController"];  //
    [self addItem:@"保存图片" class:@"SaveImageViewController"];  //
    [self addItem:@"表格高度自适应" class:@"HeightTableViewController"];  // HeightTableViewController
    
    
    [self pushInto:@"AAViewController"];
//    [self loadDic];

}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self isBeingDismissed] ) {
        NSLog(@"%s   dismissed", __func__);
    } else if ( [self isMovingFromParentViewController] ) {
        NSLog(@"%s  isMovingFromParentViewController",__func__);
    } else if ( [self isBeingPresented ]) {
        NSLog(@"%s    isBeingPresented", __func__);
    } else if ( [self isMovingToParentViewController] ) {
        NSLog(@"%s     isMovingToParentViewController", __func__);
    } else {
        NSLog(@"%s     ========其他情况==========", __func__);
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self isBeingDismissed] ) {
        NSLog(@"%s   dismissed", __func__);
    } else if ( [self isMovingFromParentViewController] ) {
        NSLog(@"%s  isMovingFromParentViewController",__func__);
    } else if ( [self isBeingPresented ]) {
        NSLog(@"%s    isBeingPresented", __func__);
    } else if ( [self isMovingToParentViewController] ) {
        NSLog(@"%s     isMovingToParentViewController", __func__);
    } else {
        NSLog(@"%s     ========其他情况==========", __func__);
    }
}
*/
- (void)loadDic {
    // 文件读取  字典
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.json" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@", dic);
    // 字典 转  json
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
}

- (void)loadView {
    [super loadView];
    CGRect rect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:rect];
    self.view.backgroundColor = [UIColor redColor];
    
    rect.size.height -= 50;
    rect.origin.y = 64;
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (void)setTable {
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeAll;
        self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UIView *v =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.1)];
        v.backgroundColor = [UIColor orangeColor];
        self.tableView.tableHeaderView = v;
    }
}

- (void)pushInto:(NSString *)className {
    Class c = NSClassFromString(className);
    UIViewController *vc = [[c alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addItem:(NSString *)name class:(NSString *)className {
    [self.dataSource addObject:name];
    [self.classArray addObject:NSClassFromString(className)];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ceell_dji";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.section];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 13.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class c = self.classArray[indexPath.section];
    UIViewController *vc = [[c alloc] init];
    
//    UIViewController *vc = [[AAViewController alloc] initWithNibName:@"AAViewController" bundle:nil];
    
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
