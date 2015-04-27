//
//  NQFinder.m
//  NQCloud
//
//  Created by libo on 14-5-21.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBFinder.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


@implementation LBFinder


/**
 * documentPath
 */
+ (NSString *)documentPath{
    //获取document的目录
    NSArray *arrayDocument = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //取出数组内容
    NSString *path = [arrayDocument objectAtIndex:0];
    return path;
}


/**
 * 创建文件夹
 */
+ (void)creatingFoldersOnDisk:(NSString *)folder{
    NSString *dir = [NSTemporaryDirectory() stringByAppendingPathComponent:folder];
    NSError *error = nil;
    BOOL create = [[NSFileManager defaultManager] createDirectoryAtPath:dir
                                            withIntermediateDirectories:YES
                                                             attributes:nil
                                                                  error:&error];
    if (create) {
        NSLog(@"successfully created the directory");
    }else{
        NSLog(@"failed to create the directory. error = %@",error);
    }
}

/**
 * creates a folder at a given path 
 */
+ (void)createFolderAtPath:(NSString *)paramPath{
    NSError *error = nil;
    NSString *path = [[self documentPath] stringByAppendingString:paramPath];
    BOOL create = [[NSFileManager defaultManager] createDirectoryAtPath:path
                                            withIntermediateDirectories:YES
                                                             attributes:nil
                                                                  error:&error];
    
    if (create) {
//        NSLog(@"成功");
    }else{
        NSLog(@"%@",error);
    }
}

//创建文件
+ (void)createFile:(NSString *)name atPath:(NSString *)path{
    
    NSString *documentsPath =[self documentPath];
    if (path) {
        documentsPath = [documentsPath stringByAppendingPathComponent:path];
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileStr = [documentsPath stringByAppendingPathComponent:name];
    BOOL res=[fileManager createFileAtPath:fileStr contents:nil attributes:nil];
    if (res) {
        NSLog(@"文件创建成功");
    }else{
        NSLog(@"文件创建失败");  
    }

}
/** 
 * create 5.txt files in the given folder,
 */
+ (BOOL)createFilesInFolder:(NSString *)paramPath data:(NSData *)data fileName:(NSString *)name{
    NSString *path = [paramPath stringByAppendingPathComponent:name];
    path = [[self documentPath] stringByAppendingString:path];
    NSError *error = nil;
    BOOL write = [data writeToFile:path
                           options:NSDataWritingAtomic
                             error:&error];
//    BOOL isOK = [[NSFileManager defaultManager] createFileAtPath:path
//                                                        contents:data
//                                                      attributes:nil];
    if(write){
        return YES;
    }else{
        NSLog(@"%@",error);
        return NO;
    }
}

/** 
 * enumerates all files/folders at a given path 
 */
+ (void)enumerateFilesInFolder:(NSString *)paramPath{
    NSError *error = nil;
    NSString *path = [[self documentPath] stringByAppendingString:paramPath];
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];

    if ([contents count] > 0 && error==nil) {
        NSLog(@"%@",contents);
    }else if ([contents count]==0){
        NSLog(@"没有下级目录");
    }else{
        NSLog(@"%@",error);
    }
    

//    //定义枚举对象
//    NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:[self documentPath]];
//    //定义变量存储路径
//    NSString *dirpath = nil;
//    while ((dirpath = [dirEnum nextObject]) != nil) {
//        NSLog(@"%@",dirpath);
//    }
}

/** deletes all files/folders in a given path */
+ (void)deleteFilesInFolder:(NSString *)paramPath{
    NSError *error = nil;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:paramPath error:&error];
    
    if (error==nil) {
        error = nil;
        for (NSString *fileName in contents) {
            NSString *filePath = [paramPath stringByAppendingPathComponent:fileName];
            if ([[NSFileManager defaultManager] removeItemAtPath:filePath error:&error]) {
                
            }
        }
    }
}

/** delete a folder with a given path */
+ (void)deleteFolder:(NSString *)paramPath{
    NSError *error = nil;
    if ([[NSFileManager defaultManager] removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingString:paramPath] error:&error]) {
//        NSLog(@"删除成功");
    }else{
        NSLog(@"error == %@",error);
    }
}

/** delete a folder with a given path */
+ (void)deletefile:(NSString *)fileName{
    NSLog(@"不可用");
    NSError *error = nil;
    if ([[NSFileManager defaultManager] removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingString:fileName] error:&error]) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"error == %@",error);
    }
}



////移动文件
//NSString *fromPath = @"/users/pic/00/text.txt";
//NSString *moveToPath = @"/users/pic/01/text0.txt";
//[[NSFileManager defaultManager] createDirectoryAtPath:[moveToPath stringByDeletingLastPathComponent]
//                          withIntermediateDirectories:YES
//                                           attributes:nil
//                                                error:nil];
//BOOL boolmove = [[NSFileManager defaultManager] moveItemAtPath:fromPath
//                                                        toPath:moveToPath
//                                                         error:nil];



+ (NSArray *)getPhotosFromAlasset:(NSArray *)assets{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (ALAsset *asset in assets) {
        if ([[asset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
            [array addObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]];
        }
    }
    return [NSArray arrayWithArray:array];
}

+ (NSArray *)getMoviesFromAlasset:(NSArray *)assets{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (ALAsset *asset in assets) {
        if ([[asset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {

        }
    }
    return [NSArray arrayWithArray:array];
}




@end
