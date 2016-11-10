//
//  TipsViewController.m
//  多种测试
//
//  Created by kfz on 16/9/3.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "TipsViewController.h"
#import "Comment.h"

@interface TipsViewController ()
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation TipsViewController
- (NSMutableArray *)array {
    if(!_array) {
        _array = [NSMutableArray array];
        for ( int i=0; i<11; i++) {
            NSDictionary *d = @{
                                @"a" : @(i),
                                @"double" : @(i * 2)
                                };
            [_array addObject:d];
            /*
            Comment *c = [[Comment alloc] init];
            User *u = [[User alloc] init];
            u.name = [NSString stringWithFormat:@"%d",i];
            c.user = u;
            
            [_array addObject:c];
             */
        }
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArray];
    [self test];
}

- (void)test {
    NSString *formatter = @"<img class=\"kfz_mesageImage\" title=\"点击看大图\"  onerror=\"picError·call(this);\"  bigSrc=\"\" src=\"\" />";
    UIImage *image = [UIImage imageNamed:@"上传本人与身份证正面合照"];
    NSLog(@"%@", formatter);
}

- (void)testArray {
    
    NSArray *arr = [self.array valueForKey:@"a"];
    NSLog(@"%@",arr);

}




@end
























