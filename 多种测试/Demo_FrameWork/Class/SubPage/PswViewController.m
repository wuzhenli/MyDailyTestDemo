//
//  TestViewController.m
//  多种测试
//
//  Created by kfz on 16/6/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PswViewController.h"
#import <AFNetworking.h>
#import "PSTextField.h"
#import "AViewController.h"
#import "Tools.h"
#import "ANavigationController.h"


@interface PswViewController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) PSTextField *textField;
@property (weak, nonatomic) PSTextField *textFieldSecond;
@property (copy, nonatomic) NSString *text;
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation PswViewController

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = [UIScreen mainScreen].bounds;
        UITableView *tv = [[UITableView alloc] initWithFrame:rect];
        _tableView = tv;
        [self.view addSubview:tv];
    }
    return _tableView;
}
- (void)loadView {
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
   
    UIButton *btn = ({
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor greenColor];
        btn.frame = CGRectMake(100, 400, 220, 40);
        [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn;
    });
}
- (void)show {
//    NSLog(@"%@",self.textField.text);
    AViewController *vc = [[AViewController alloc] init];
    ANavigationController *nav = [[ANavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
    
    UIViewController *vc1 = [Tools getCurrentVC];
    NSLog(@"%@",[vc1 class]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


#pragma -mark tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    PSTextField *tf = [[PSTextField alloc] initWithFrame:CGRectMake(10, 10, 220, 40)];
    tf.keyboardType = UITextBorderStyleLine;
    
    [cell addSubview:tf];
    _textField = tf;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.;
}


- (void)requestTest {
    NSString *urlString = @"http://app.kongfz.com/message/listOftenUsedMsg";
    NSDictionary *params = @{
                             @"apiId" : @"孔夫子旧书网_iOS_1.4.5_1.0",
                             @"token" : @"308727fe9998d863c22839d1d4cea00e"
                             };
    
    NSURL *url = [NSURL URLWithString:urlString];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
   
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:nil parameters:params];
    [request setTimeoutInterval:30.0f];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    NSDate *curDate = [NSDate date];
    
    
    
    [operation
     setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation1, id responseObject) {
         
     }
     failure:^(AFHTTPRequestOperation *operation2, NSError *error) {
         
     }];
    [httpClient enqueueHTTPRequestOperation:operation];
}

- (void)timer {
    
    NSTimeInterval period = 1.0; //设置时间间隔
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"-------");
    });
    dispatch_resume(_timer);

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
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
