//
//  KFZImageDBTool.m
//  Kongfz
//
//  Created by kfz on 16/9/9.
//  Copyright © 2016年 dp. All rights reserved.
//

#import "KFZImageDBTool.h"
#import <FMDB.h>

static NSString *tableName = @"imageTable";
static FMDatabase *db = nil;
@implementation KFZImageDBTool

/**
 * 开启数据库
 */
+ (BOOL)openDatatase {
    NSString *temPath = NSTemporaryDirectory();
    NSString *filePath = [temPath stringByAppendingPathComponent:@"imageTable.db"];
    db = [FMDatabase databaseWithPath:filePath];
    if ([db open]) {
//        DLog(@"-----------------------------开启  数据库-----------------------------");
        NSString *createSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS  %@  (id TEXT PRIMARY KEY, image  BLOB )", tableName];
        BOOL result = [db executeUpdate:createSql];
        if (result) {
            return YES;
        }
    }
    return NO;
}

/**
 * 保存图片
 */
+ (void)insertImage:(UIImage *)imageIn clientMsgId:(NSString *)imgId {
    NSData *imgData = [NSKeyedArchiver archivedDataWithRootObject:imageIn];
    NSString *sql = [NSString stringWithFormat:@"insert into %@ (id, image) values (?, ?)", tableName];
    BOOL result = [db executeUpdate:sql,imgId, imgData ];
    if (result == NO) {
        NSLog(@"保持图片失败：%@", imgId);
    } else {
        NSLog(@"保持 成功：%@", imgId);
    }
    
//    void(^Block)(UIImage *, NSString *) = ^(UIImage *image, NSString *imgId) {
//        NSData *imgData = [NSKeyedArchiver archivedDataWithRootObject:image];
//        NSString *sql = [NSString stringWithFormat:@"insert into %@ (id, image) values (?, ?)", tableName];
//        BOOL result = [db executeUpdate:sql,imgId, imgData ];
//        if (result == NO) {
//            DLog(@"保持图片失败：%@", imgId);
//        }
//    };
//    Block(imageIn, imgId);
}

/**
 * 查找图片
 */
+ (UIImage *)queryImageById:(NSString *)imgId {
    NSString *sql = [NSString stringWithFormat:@"select * from %@", tableName];
    if (imgId) {
        sql = [NSString stringWithFormat:@"select * from %@ where id = \"%@\"",tableName, imgId];
    }
    
    FMResultSet *set = [db executeQuery:sql];
    while ( [set next] ) {
        NSData *data = [set dataForColumn:@"image"];
        UIImage *image = (UIImage *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
        return image;
    }
    return nil;
}

/**
 * 关闭数据库
 */
+ (void)closeDB {
    if (db) {
        [db close];
        db = nil;
//        DLog(@"-----------------------------关闭数据库-----------------------------");
    }
}


/**
 * 删除数据库
 */
+ (void)deleteDB {
    NSString *temPath = NSTemporaryDirectory();
    NSString *filePath = [temPath stringByAppendingPathComponent:@"imageTable.db"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        [manager removeItemAtPath:filePath error:nil];
    }
}
@end



















