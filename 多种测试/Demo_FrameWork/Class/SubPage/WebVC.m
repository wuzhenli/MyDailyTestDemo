//
//  WebVC.m
//  多种测试
//
//  Created by kfz on 16/9/27.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "WebVC.h"

@interface WebVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIBarButtonItem *backItem;
@property (strong, nonatomic) UIBarButtonItem *closeItem;
@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createItem];
    
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

//    NSLog(@"starLoad   %@", request.URL.absoluteString);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self adjust];
}
- (void)adjust {
    if ([self.webView canGoBack]) {
        self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
    } else {
        self.navigationItem.leftBarButtonItems = @[ self.closeItem];
    }
}


- (void)back {
    [self.webView goBack];
    [self adjust];
}
- (void)close {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)createItem {
    self.backItem = [[UIBarButtonItem alloc] initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.closeItem = [[UIBarButtonItem alloc] initWithTitle:@"❎" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
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
