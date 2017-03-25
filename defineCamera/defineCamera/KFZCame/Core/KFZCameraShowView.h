//
//  KFZCameraShowView.h
//  defineCamera
//
//  Created by kfz on 2017/3/3.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFZCameraShowView : UIView

@property (strong, nonatomic) NSData *imageData;

@property (copy, nonatomic) dispatch_block_t usePhotoBlock;
@property (copy, nonatomic) dispatch_block_t reTakePhotoBlock;

@end
