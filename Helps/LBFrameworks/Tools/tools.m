//
//  tools.m
//  NQCloud
//
//  Created by libo on 14-5-23.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "tools.h"
#import "MBProgressHUD.h"

@implementation tools


+ (void)showMessage:(NSString *)msg{
    if ([msg isKindOfClass:[NSString class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                message:msg
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
            [alertView show];
        });
    }
}






@end
