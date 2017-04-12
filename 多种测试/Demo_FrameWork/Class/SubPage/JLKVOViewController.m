//
//  JLKVOViewController.m
//  多种测试
//
//  Created by kfz on 2017/4/12.
//  Copyright © 2017年 Jaly. All rights reserved.
//

#import "JLKVOViewController.h"
#import "KVO_Person.h"

@interface JLKVOViewController ()
@property (strong, nonatomic) KVO_Person *person;
@end

@implementation JLKVOViewController
- (KVO_Person *)person {
    if (_person == nil) {
        _person = [KVO_Person new];
    }
    return _person;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"key: %@ \n %@", keyPath, change);
}

static int age = 1;
- (IBAction)changeAge:(id)sender {
    self.person.age = age;
    age ++;
}
- (IBAction)changeAgeKVO:(id)sender {
    [self.person setValue:@(age) forKey:@"_age"];
    age ++;
}



- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"age"];
}





@end













