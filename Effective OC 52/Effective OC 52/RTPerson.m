//
//  RTPerson.m
//  Effective OC 52
//
//  Created by kfz on 2017/3/21.
//  Copyright © 2017年 kongfz. All rights reserved.
//

#import "RTPerson.h"
#import <objc/runtime.h>

@interface RTPerson ()

@property (strong, nonatomic) NSMutableDictionary *backingStore;

@end

id autoDictionaryGetter(id self, SEL _cmd) {
    RTPerson *typeSelf = (RTPerson *)self;
    NSMutableDictionary *storeDic = typeSelf.backingStore;
    NSString *selector = NSStringFromSelector(_cmd);
    
    return [storeDic objectForKey:selector];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    RTPerson *typeSelf = (RTPerson *)self;
    NSMutableDictionary *storeDic = typeSelf.backingStore;
    
    NSString *selector = NSStringFromSelector(_cmd); // setOpaqueObject:
    NSMutableString *muSel = [selector mutableCopy];
    [muSel deleteCharactersInRange:NSMakeRange(muSel.length-1, 1)]; // delete :
    [muSel deleteCharactersInRange:NSMakeRange(0, 3)];              // delete set
    NSString *lowFirstLetter = [[muSel substringToIndex:1] lowercaseString];
    [muSel replaceCharactersInRange:NSMakeRange(0, 1) withString:lowFirstLetter];
//    NSLog(@"setter 转换完成：%@", muSel);
    
    if (value) {
        [storeDic setValue:value forKey:muSel];
    } else {
        [storeDic removeObjectForKey:muSel];
    }
}



@implementation RTPerson

@dynamic string, date, number, opaqueObject;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selector = NSStringFromSelector(sel);
    if ([selector containsString:@"ackingStore"]) {
        return NO;
    }
//    NSLog(@"resolveInstanceMethod -- sel:%@", selector);
    
    if ([selector hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    
    return YES;
}



@end






















