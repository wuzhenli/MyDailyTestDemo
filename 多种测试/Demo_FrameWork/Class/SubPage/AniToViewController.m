//
//  AniToViewController.m
//  多种测试
//
//  Created by kfz on 16/9/17.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "AniToViewController.h"

@interface AniToViewController ()

@end

@implementation AniToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.backgroundColor = [UIColor greenColor];
        imgV.frame = CGRectMake(0, 0, 200, 200);
        
        
        imgV.center = CGPointMake(SC_Width/2., SC_Height/2.);
        [self.view addSubview:imgV];
        
        imgV.image = [UIImage imageNamed:@"QQ"];
        imgV.layer.cornerRadius = imgV.frame.size.width/2.;
        imgV.layer.masksToBounds = YES;
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        self.imgView = imgV;
    }
}
- (IBAction)dismisVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
