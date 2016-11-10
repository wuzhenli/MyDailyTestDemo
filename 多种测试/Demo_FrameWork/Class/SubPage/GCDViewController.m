//
//  GCDViewController.m
//  多种测试
//
//  Created by kfz on 16/9/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)barrier:(id)sender {
    // 不能使用 全局并发队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("baidu.www", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"download  1  ----   %zd", i);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"download  2  ----   %zd", i);
        }
    });
    
    
    // dispatch_barrier_async  中的任务在子线程执行，dispatch_barrier_sync的任务在主线程
    dispatch_barrier_sync(queue, ^{
        NSLog(@"+++++++++++ %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"download  3  ----   %zd", i);
        }
    });
    
    
}

- (IBAction)bainli:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    dispatch_apply(20, queue, ^(size_t index) {
        NSLog(@"%zu  %@", index, [NSThread currentThread]);
    });
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











