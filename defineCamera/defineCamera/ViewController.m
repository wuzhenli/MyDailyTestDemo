//
//  ViewController.m
//  defineCamera
//
//  Created by kfz on 2017/3/25.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "KFZBaseCameraVC.h"
#import "KFZImageDBTool.h"
// 处理图片
#import "UIImage+extension.h"


@interface ViewController ()<KFZBaseCameraVCDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imgView.layer.borderColor = [UIColor redColor].CGColor;
    _imgView.layer.borderWidth = 1.0;
    // open DB
    [KFZImageDBTool openDatatase];
}

- (IBAction)takePhoto:(id)sender {
    KFZBaseCameraVC *vc = [[KFZBaseCameraVC alloc] initWithDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)KFZBaseCameraVC:(KFZBaseCameraVC *)vc takeImageData:(NSData *)data {
    UIImage *img = [[UIImage imageWithData:data] getSendImage];
    self.imgView.image = img;
    [self.view setNeedsLayout];
    NSDate *date = [NSDate date];
    NSString *clientMsgId = [NSString stringWithFormat:@"%lf",[date timeIntervalSince1970]];
    
    NSString *ID = clientMsgId; // [NSString stringWithFormat:@"%ld", time(NULL)];
    NSLog(@"ID -- : %@", ID);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [KFZImageDBTool insertImage:[img getThumbnailImage] clientMsgId:ID];
    });
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
