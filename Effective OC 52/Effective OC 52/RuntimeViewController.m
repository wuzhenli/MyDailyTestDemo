//
//  RuntimeViewController.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/21.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "RuntimeViewController.h"
#import "RTPerson.h"

@interface RuntimeViewController ()
@property (strong, nonatomic) RTPerson *person;
@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RTPerson *p = [RTPerson new];
    self.person = p;
}
- (IBAction)action_1:(id)sender {
    
    self.person.opaqueObject = @"dd";
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableDictionary *dic = [self.person valueForKey:@"backingStore"];
    NSLog(@"dic:%@", dic);
    
//    NSLog(@"%@", self.person.opaqueObject);
}


@end



