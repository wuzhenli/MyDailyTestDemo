//
//  SaveImageViewController.m
//  多种测试
//
//  Created by kfz on 16/9/5.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SaveImageViewController.h"
#import <UIImageView+WebCache.h>
#import "SaveSecondViewController.h"
#import <AudioToolbox/AudioToolbox.h>


typedef void(^Block)();

@interface SaveImageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIImageView *webImgView;

@property (weak, nonatomic) IBOutlet UIImageView *imgVeiw;

@property (copy, nonatomic) Block blcok;
@property (copy, nonatomic) NSString *name;

@property (strong, nonatomic) NSTimer *timer;
@end

@implementation SaveImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(print) userInfo:nil repeats:YES];
    [self rightItem];
}
- (void)rightItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"sound" style:UIBarButtonItemStyleDone target:self action:@selector(sound)];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)sound {
    AudioServicesPlaySystemSound(1007);
}
- (IBAction)playSound:(UIButton *)sender {
    int soundId = [sender.currentTitle intValue];
    AudioServicesPlaySystemSound(soundId);
    
    [sender setTitle:[NSString stringWithFormat:@"%d", soundId +1] forState:UIControlStateNormal];
}

- (IBAction)presentVC:(id)sender {
    SaveSecondViewController *vc = [[SaveSecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)pushVC:(id)sender {
    SaveSecondViewController *vc = [[SaveSecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)print {
    NSLog(@"%s", __func__);
}
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *str = @"\"http://www.baidu.com\"";
    NSString *str1 = @"'http://www.baidu.com'";
    NSLog(@"%@    %@", str, [self trimSemicolon:str]);
    NSLog(@"%@    %@", str1, [self trimSemicolon:str1]);
}

/**
 * 去除两边的分号
 */
- (NSString *)trimSemicolon:(NSString *)str {
    
    if ([[str substringToIndex:1] isEqualToString:@"'"] || [[str substringToIndex:1] isEqualToString:@"\""]) {
        str = [str substringFromIndex:1];
    }
    if([[str substringFromIndex:str.length-1] isEqualToString:@"'"] || [[str substringFromIndex:str.length-1] isEqualToString:@"\""]) {
        str = [str substringToIndex:str.length - 1];
    }
    return str;
}

- (void)testWebImgView {
    NSString *urlStr = @"http://117.121.31.35:8333/6,0b103428502019fc6ecc2e78?.jpg";
    __weak typeof(self) sf = self;
    [self.webImgView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGRect rect = sf.webImgView.frame;
        rect.size = image.size;
        sf.webImgView.frame = rect;
        [sf.view setNeedsLayout];
        [sf.view layoutIfNeeded];
    }];
    self.webImgView.maskView = [[UIView alloc] initWithFrame:self.webImgView.bounds];
}

- (IBAction)saveImage:(id)sender {
    UIImage *image = [UIImage imageNamed:@"a9999a"];
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), NULL);
}
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"呵呵";
    if (!error) {
        message = @"成功保存到相册";
    }else
    {
        message = [error description];
    }
    NSLog(@"message is %@",message);
}


@end
