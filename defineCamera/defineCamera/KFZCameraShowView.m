//
//  KFZCameraShowView.m
//  defineCamera
//
//  Created by kfz on 2017/3/3.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "KFZCameraShowView.h"


@interface KFZCameraShowView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
@implementation KFZCameraShowView


- (void)setImageData:(NSData *)imageData {
    _imageData = imageData;
    _imgView.image = [UIImage imageWithData:imageData];
    
}

- (IBAction)retake:(id)sender {
    if (self.reTakePhotoBlock) {
        self.reTakePhotoBlock();
    }
    self.hidden = YES;
}

//- (void)dealloc {
//    NSLog(@"%s", __func__);
//}

- (IBAction)usePhoto:(id)sender {
    if (self.usePhotoBlock) {
        self.usePhotoBlock();
    }
}

@end
