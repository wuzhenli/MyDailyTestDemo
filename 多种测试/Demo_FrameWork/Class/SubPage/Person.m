//
//  Person.m
//  多种测试
//
//  Created by kfz on 2017/3/10.
//  Copyright © 2017年 Jaly. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

#define PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"person.plist"]

@implementation Person

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:PATH];
}
+ (instancetype)sharePerson {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
}



- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count;
    Ivar *ivar = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar iv = ivar[i];
        const char *name = ivar_getName(iv);
        NSString *strName = [NSString stringWithUTF8String:name];
        //利用KVC取值
        id value = [self valueForKey:strName];
        [aCoder encodeObject:value forKey:strName];
    }
    free(ivar);
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        //获取类中所有成员变量名
        Ivar *ivar = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            Ivar iva = ivar[i];
            const char *name = ivar_getName(iva);
            NSString *strName = [NSString stringWithUTF8String:name];
            //进行解档取值
            id value = [aDecoder decodeObjectForKey:strName];
            //利用KVC对属性赋值
            [self setValue:value forKey:strName];
        }
        free(ivar);
    }
    return self;
}

@end
