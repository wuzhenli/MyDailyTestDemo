//
//  RuntimeViewController.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/21.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "RuntimeViewController.h"
#import "RTCar.h"
#import "RTStudent.h"

@interface RuntimeViewController ()
//@property (strong, nonatomic) RTPerson *person;
@property (strong, nonatomic) RTStudent *student;
@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.student = [RTStudent new];
    _student.name = @"name student";
    _student.age = 12;
}
- (IBAction)action_1:(id)sender {
    NSLog(@"%@", _student.name);
    NSLog(@"%lu", _student.age);
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SEL s = NSSelectorFromString(@"run");
    [_student performSelector:s];
//    NSLog(@"%@", self.person.opaqueObject);
}


@end



