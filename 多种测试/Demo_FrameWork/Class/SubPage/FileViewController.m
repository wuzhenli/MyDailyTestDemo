//
//  FileViewController.m
//  多种测试
//
//  Created by kfz on 16/9/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "FileViewController.h"

@interface FileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLab;

@property (copy, nonatomic) NSString *filePath;

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test.db"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.filePath]) {
        [[NSFileManager defaultManager] createFileAtPath:self.filePath contents:nil attributes:nil];
    }
    [self judgeFile:nil];
}
- (IBAction)createFile:(id)sender {
    NSString *str = @"abc";
    [str writeToFile:self.filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

}
- (IBAction)deleteFile:(id)sender {
    NSString *str = @"";
    [str writeToFile:self.filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

- (IBAction)judgeFile:(id)sender {
    NSString *str = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
    self.showLab.text = str;
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







