//
//  ViewController.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/21.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import "RTCar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [RTCar logIvars];
    [RTCar logMethodList];
    [RTCar logPropertyList];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
