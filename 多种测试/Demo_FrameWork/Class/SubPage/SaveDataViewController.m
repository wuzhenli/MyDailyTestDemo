//
//  SaveDataViewController.m
//  多种测试
//
//  Created by kfz on 2017/3/10.
//  Copyright © 2017年 Jaly. All rights reserved.
//

#import "SaveDataViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface SaveDataViewController ()

@end

@implementation SaveDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [Person new];
    p.name = @"pname";
    p.uid = @"5683905";
    
    p.age = 12;
    p.weight = 55.4;
    p.validataPhone = YES;
    p.validataMail = NO;
    p.seller = YES;
    p.phoneNum = @"13562837765";
    /*
     
     @property (copy, nonatomic) NSString *name;
     @property (copy, nonatomic) NSString *uid;
     
     @property (assign, nonatomic) BOOL validataPhone;
     @property (assign, nonatomic) BOOL validataMail;
     @property (assign, nonatomic, getter=isSeller) BOOL seller;
     
     @property (assign, nonatomic) NSInteger age;
     @property (assign, nonatomic) CGFloat weight;
     
     @property (copy, nonatomic) NSString *phoneNum;
     

     */
    [p save];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    Person *p = [Person sharePerson];
//    NSLog(@"name:%@, age:%lu   weight:%lf  validataPhone:%d", p.name, p.age, p.weight, p.validataPhone);
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([Person class], &count);
    for (int i=0; i<count; i++) {
        Ivar iv = ivar[i];
        const char *name = ivar_getName(iv);
        NSString *strName = [NSString stringWithUTF8String:name];
        NSLog(@"%@", strName);
    }
    NSLog(@"property   ------");
    {
        objc_property_t *ivar = class_copyPropertyList([Person class], &count);
        for (int i=0; i<count; i++) {
            objc_property_t iv = ivar[i];
            
            const char *name = property_getName(iv);
            NSString *strName = [NSString stringWithUTF8String:name];
            NSLog(@"%@", strName);
        }
    }
}




@end























