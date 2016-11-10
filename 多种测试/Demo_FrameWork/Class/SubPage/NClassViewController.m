//
//  NClassViewController.m
//  多种测试
//
//  Created by kfz on 16/7/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "NClassViewController.h"

@interface NClassViewController ()

@end

@implementation NClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    NSString *str = @"price 1.2  price 2.3 price 4.5   price 0.66 ";
    [self test_scanUpToString];
    NSString *s = @"-1245-2434";
    s = [s stringByReplacingOccurrencesOfString:@"-" withString:@"*"];
    NSLog(@"%@",s);
    
}

- (void)test_scanUpToString {
    NSString *str = @"aa bb cc dd ++ ee ff gg hh ii -- ";
    NSScanner *scanner = [NSScanner scannerWithString:str];
    NSString *s = nil;
    [scanner scanUpToString:@"++" intoString:NULL];
//    NSLog(@"%@",s);
    [scanner scanUpToString:@"--" intoString:&s];
    NSLog(@"%@",s);
}

- (void)test:(NSString *)string {
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSString *str = nil;
    float f ;
    while (!scanner.isAtEnd) {
        [scanner scanString:@"price" intoString:&str];
        NSLog(@"%@",str);
        [scanner scanFloat:&f];
        NSLog(@"%f", f);
    }
    
}

- (void)test2 {
    NSString *string = @"my age is d 23    34.0\n\n";
         NSInteger i;
        float f;
    NSString *resultString;
    NSString *dString;
    //扫描字符串
    NSScanner *theScanner = [NSScanner scannerWithString:string ];
    
    while (theScanner.isAtEnd == NO) {
        [theScanner scanString:@"my age is" intoString:&resultString];
        NSLog(@"%@",resultString);
        
        //扫描字符串中的d字符
        [theScanner scanString:@"d" intoString:&dString];
        NSLog(@"%@",dString);
        
        
        //扫描字符串中的整型数据
        [theScanner scanInteger:&i];
        NSLog(@"%ld",i);
        //扫描字符串中的浮点型数据
        [theScanner scanFloat:&f];
        NSLog(@"%f",f);
    }

}

- (void)test1 {
    NSString *string = @"Product: Acme Potato Peeler; Cost: 0.98 73\n\
Product: Chef Pierre Pasta Fork; Cost: 0.75 19\n\
Product: Chef Pierre Colander; Cost: 1.27 2\n";
    
    NSCharacterSet *semicolonSet;
    NSScanner *theScanner;
    
    NSString *PRODUCT = @"Product:";
    NSString *COST = @"Cost:";
    
    NSString *productName;
    float productCost;
    NSInteger productSold;
    
    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
    theScanner = [NSScanner scannerWithString:string];
    
    while ([theScanner isAtEnd] == NO)
        
    {
        
        if ([theScanner scanString:@"Product:" intoString:NULL] &&
            
            [theScanner scanUpToCharactersFromSet:semicolonSet
                                       intoString:&productName] &&
            
            [theScanner scanString:@";" intoString:NULL] &&
            
            [theScanner scanString:COST intoString:NULL] &&
            
            [theScanner scanFloat:&productCost] &&
            
            [theScanner scanInteger:&productSold])
            
        {  
            
            NSLog(@"Sales of %@: $%1.2f", productName, productCost * productSold);  
            
        }  
        
    }
}

@end


















