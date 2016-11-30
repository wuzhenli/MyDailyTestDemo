//
//  BBViewController.m
//  多种测试
//
//  Created by kfz on 16/8/12.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation BBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *tintColor = [UIColor orangeColor];
    self.searchBar.tintColor = tintColor;
    self.searchBar.showsCancelButton = YES;
    self.searchBar.showsBookmarkButton = YES;

    UIButton *cancelBtn = (UIButton *) [self.searchBar valueForKey:@"_cancelButton"];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitle:@"取消" forState:UIControlStateHighlighted];
    [cancelBtn setTitleColor:tintColor forState:UIControlStateDisabled];
    [cancelBtn setTitleColor:tintColor forState:UIControlStateNormal];
    
    self.searchBar.prompt = @"prompt";
                             

    
    
    [self.searchBar setImage:[UIImage imageNamed:@"QQ"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    
    
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"before  %s", __func__);
    [super viewDidAppear:animated];
    NSLog(@"after  %s", __func__);
}
- (IBAction)popViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
