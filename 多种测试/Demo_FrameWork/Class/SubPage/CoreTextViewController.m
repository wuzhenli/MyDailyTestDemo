//
//  CoreTextViewController.m
//  多种测试
//
//  Created by kfz on 16/8/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CoreTextViewController.h"
#import "CTView.h"


@interface CoreTextViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet CTView *ctView;

@end

@implementation CoreTextViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.textColor = [UIColor blackColor];
    config.width = self.ctView.width;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imgContent.json" ofType:nil];
    
    CoreTextData *data = [CTFrameParser parseContentWithFilePath:path config:config];
    self.ctView.data = data;
    self.ctView.height = data.height;
    
    self.ctView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}



/*
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGAffineTransform trans =  self.redView.transform;
    trans.c = 0.2;
    
    self.redView.transform = trans;
    NSLog(@"%@",NSStringFromCGRect(self.redView.frame));
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


















