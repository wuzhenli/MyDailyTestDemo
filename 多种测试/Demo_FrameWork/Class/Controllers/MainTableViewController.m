//
//  MainTableViewController.m
//  Demo_FrameWork
//
//  Created by kfz on 16/6/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//  主页

#import "MainTableViewController.h"

#import "AAViewController.h"
#import <WebKit/WebKit.h>

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
//    WKWebView;
    NSLog(@"%s", __func__);
    [super viewDidLoad];
    [self setTable];
    [self setRightButton];
    
    [self addItem:@"扫描二维码" class:@"ScaleViewController"];  // ScaleViewController
    [self addItem:@"测试  测试   测试" class:@"AAViewController"];  // 
    [self addItem:@"TTTAttributedLabel" class:@"RootViewController"];  // 
    [self addItem:@"NSlayoutConstraint" class:@"LayoutViewController"];  // 
    [self addItem:@"深拷贝" class:@"DepyCopyViewController"];  // 
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
    
    [self addItem:@"iOS Tips" class:@"TipsViewController"];  //
    [self addItem:@"复制 粘贴 功能" class:@"PastViewController"];  //
    [self addItem:@"保存图片" class:@"SaveImageViewController"];  //
    [self addItem:@"表格高度自适应" class:@"HeightTableViewController"];  // HeightTableViewController
     
    
    
      
    [self pushInto:@"AAViewController"];
//    [self loadDic];
    self.title = NSStringFromClass([self class]);
}

- (void)testEncode {
    NSString *url=@"http://neibutousu.kongfz.com/member/complaints_admin/manage_complaint.php?act=detail&complaintId=246348";
    NSString *encodedValue = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    NSLog(@"-=-=    %@", encodedValue);
    
    
    NSString *encode_1 = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    NSString *encode_2 = [self encodeString:url];
    NSLog(@"-=-=    %@", encode_2);
    NSString *deencode = [self decodeString:encode_2];
    NSLog(@"-=-=    %@", deencode);
}

- (NSString *)decodeString:(NSString*)encodedString

{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

//URLEncode
- (NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = NO;
}


- (void)setBGView {
    UIImageView *img = ({
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
        imgV.frame = self.view.bounds;
        
        
        imgV;
    });
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40 - 64, 100, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btcClicked) forControlEvents:UIControlEventTouchUpInside];
    [img addSubview:btn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [img addGestureRecognizer:tap];

    [img addGestureRecognizer:tap];
    
    self.tableView.backgroundView = img;
//    [self.view addSubview:img];
}

- (void)btcClicked {
    NSLog(@"%s  %s", __func__, __FUNCTION__);
}
- (void)tap:(UIGestureRecognizer *)gesture {
    NSLog(@"%@", gesture);
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
    NSLog(@"%s", __func__);
    
    
    CGRect rect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:rect];
    self.view.backgroundColor = [UIColor redColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    rect.size.height -= 64;
    rect.origin.y = 64;
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (void)setRightButton {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"R" style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)right {
    NSLog(@"%@", self.tableView.visibleCells);
}
- (void)setTable {
    {
        
        self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        self.tableView.separatorInset = UIEdgeInsetsMake(30, 30, 10, 10);
        self.tableView.separatorColor = [UIColor greenColor];
        
        UIView *v =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 10.1)];
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
    
//    AAViewController *vc = [[AAViewController alloc] initWithNibName:@"AAViewController" bundle:nil];
    
    
    [self.navigationController pushViewController:vc animated:NO];
//    [vc addREdView];
}



@end
