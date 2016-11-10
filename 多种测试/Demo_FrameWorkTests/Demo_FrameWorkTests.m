//
//  Demo_FrameWorkTests.m
//  Demo_FrameWorkTests
//
//  Created by kfz on 16/6/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Demo_FrameWorkTests : XCTestCase

@end

@implementation Demo_FrameWorkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    //设置变量和设置预期值
    NSUInteger a = 10;NSUInteger b = 15;
    NSUInteger expected = 24;
    //执行方法得到实际值
    NSUInteger actual = [self add:a b:b];
    //断言判定实际值和预期是否符合
    XCTAssertEqual(expected, actual,@"add方法错误！");
}
-(NSUInteger)add:(NSUInteger)a b:(NSUInteger)b{
    return a+b;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
