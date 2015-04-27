//
//  NQSave.m
//  NQCloud
//
//  Created by libo on 14-5-20.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "NQSave.h"
#import "tools.h"

@implementation NQSave


- (void)saveImageToPhotos:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(image,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   NULL);
}

- (void)saveVideo{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"000" ofType:@".m4v"];
//    UISaveVideoAtPathToSavedPhotosAlbum(path,
//                                        self,
//                                        @selector(video:didFinishSavingWithError:contextInfo:),
//                                        nil);
}




// 指定回调方法

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"没有权限获取相册"
                                                        message:@"请在系统的设置、隐私、照片中开启少年云权限"
                                                       delegate:nil
                                              cancelButtonTitle:@"关闭"
                                              otherButtonTitles:nil];
        [alert show];

    }else{
        msg = @"保存图片成功" ;
    }
    [tools showMessage:msg];
}

- (void)video: (UIImage *)video didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存视频失败" ;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"没有权限获取相册"
                                                        message:@"请在系统的设置、隐私、照片中开启少年云权限"
                                                       delegate:nil
                                              cancelButtonTitle:@"关闭"
                                              otherButtonTitles:nil];
        [alert show];

    }else{
        msg = @"保存视频成功" ;
    }
    [tools showMessage:msg];
}



@end
