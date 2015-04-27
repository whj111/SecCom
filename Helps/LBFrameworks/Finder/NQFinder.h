//
//  NQFinder.h
//  NQCloud
//
//  Created by libo on 14-5-21.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface NQFinder : NSObject

+ (NSString *)documentPath;

+ (void)creatingFoldersOnDisk:(NSString *)folder;

+ (void)createFolderAtPath:(NSString *)paramPath;

+ (void)createFilesInFolder:(NSString *)paramPath data:(NSData *)data fileName:(NSString *)name;

+ (void)enumerateFilesInFolder:(NSString *)paramPath;

+ (void)deleteFilesInFolder:(NSString *)paramPath;

+ (void)deleteFolder:(NSString *)paramPath;



+ (NSArray *)getPhotosFromAlasset:(NSArray *)assets;




@end
