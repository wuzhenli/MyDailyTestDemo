//
//  SqlImageViewController.m
//  多种测试
//
//  Created by kfz on 16/9/9.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "SqlImageViewController.h"
#import "JLDBTool.h"

@interface SqlImageViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation SqlImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test.txt"];
    NSLog(@"%@", filePath);
    
    //
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        [manager removeItemAtPath:filePath error:nil];
    } else {
        [manager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
}


- (void)changeSmallSrc {
    NSString *msgContent = @"<img class=\"kfz_mesageImage\" title=\"\\U70b9\\U51fb\\U770b\\U5927\\U56fe\"  onerror=\"picError\\U00b7call(this);\"  bigSrc=\"http://117.121.31.35:8333/3,0b10342850201a4b2bafdcc3?.jpg\" src=\"http://117.121.31.35:8333/5,0b10342850201a4a92c7b610?.jpg\" />";
    __block NSString *ret = msgContent;
    [[msgContent componentsSeparatedByString:@" "] enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj hasPrefix:@"src="]) {
            NSString *replaceResult = @"src=\"aabbaa\"";
            ret = [ret stringByReplacingOccurrencesOfString:obj withString:replaceResult];
            NSLog(@"%@", ret);
            *stop = YES;
        }
    }];
    

}


- (IBAction)getPic:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ( ![UIImagePickerController isSourceTypeAvailable:sourceType] ) {
        return;
    }
    UIImagePickerController *pick = [[UIImagePickerController alloc] init];
    pick.sourceType = sourceType;
    pick.allowsEditing = YES;
    pick.delegate = self;
    [self presentViewController:pick animated:YES completion:nil];
    
}
- (IBAction)savePic:(id)sender {
    UIImage *image = [JLDBTool queryImageById:@"1473391580"];
    self.imgView.image = image;
}
- (IBAction)showImage:(id)sender { //
    UIImage *image = [JLDBTool queryImageById:@"1473390626"];
    self.imgView.image = image;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    if (image) {
        NSString *imgId = [NSString stringWithFormat:@"%ld", time(NULL)];
        NSLog(@"%@", imgId);
        [JLDBTool insertImage:image imgId:imgId];
    }
}

@end









