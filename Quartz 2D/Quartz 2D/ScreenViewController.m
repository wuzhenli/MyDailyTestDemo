//
//  ScreenViewController.m
//  Quartz 2D
//
//  Created by kfz on 2017/3/20.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ScreenViewController.h"

@interface ScreenViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIImage *)getScreenImage {
    UIImage *image = nil;
    
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, [UIScreen mainScreen].scale);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return image;
}


- (IBAction)screenImage:(id)sender {
    UIImage *image = [self getScreenImage];
    NSLog(@"%@", NSStringFromCGSize(image.size));
    self.imgView.image = image;
    [self.view bringSubviewToFront:self.imgView];
}




@end
























