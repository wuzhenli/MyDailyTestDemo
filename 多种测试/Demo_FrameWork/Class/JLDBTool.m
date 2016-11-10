//
//  JLDBTool.m
//  多种测试
//
//  Created by kfz on 16/9/9.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "JLDBTool.h"
#import <FMDB.h>

static NSString *tableName = @"imageTable";
static FMDatabase *db = nil;
@implementation JLDBTool


+ (void)load_3 {
    NSString *temPath = NSTemporaryDirectory();
    NSString *filePath = [temPath stringByAppendingPathComponent:@"imageTable.db"];
    
    db = [FMDatabase databaseWithPath:filePath];
    if ([db open]) {
        NSLog(@"链接数据库");
    } else {
        NSLog(@"链接数据库--失败");
    }
}

+ (BOOL)createTable {
    if ([db open]) {
        NSLog(@"链接数据库");
        NSString *createSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS  %@  (id TEXT PRIMARY KEY, image  BLOB )", tableName];
        BOOL result = [db executeUpdate:createSql];
        if (result) {
            NSLog(@"建表成功");
            return YES;
        } else {
            NSLog(@"建表--失败");
        }
    } else {
        NSLog(@"链接数据库--失败");
    }
    return NO;
}
+ (void)insertImage:(UIImage *)imageIn imgId:(NSString *)imgId {
    void(^Block)(UIImage *, NSString *) = ^(UIImage *image, NSString *imgId) {
        NSData *imgData = [NSKeyedArchiver archivedDataWithRootObject:image];
        NSString *sql = [NSString stringWithFormat:@"insert into %@ (id, image) values (?, ?)", tableName];
        [db executeUpdate:sql,imgId, imgData ];
    };
    if (db) {
        Block(imageIn, imgId);
    } else {
        BOOL result = [self createTable];
        if (result) {
            Block(imageIn, imgId);
        }
    }
}
+ (UIImage *)queryImageById:(NSString *)imgId {
    NSString *sql = [NSString stringWithFormat:@"select * from %@", tableName];
    if (imgId) {
        sql = [NSString stringWithFormat:@"select * from %@ where id = %@",tableName, imgId];
    }
    
    FMResultSet *set = [db executeQuery:sql];
    while ( [set next] ) {
        NSData *data = [set dataForColumn:@"image"];
        UIImage *image = (UIImage *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
        return image;
    }
    return nil;
}

@end








