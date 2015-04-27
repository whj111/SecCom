//
//  AppDetailRequest.m
//  SecCom
//
//  Created by libo on 4/21/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "AppDetailRequest.h"
#import "AppModel.h"

@implementation AppDetailRequest

- (NSString *)requestURL{
    return [RequestURL urlWithTpye:UrlTypeAppDetails];
}

+ (NSDictionary *)HTTPHeader{
    return nil;
}

#pragma mark ----- 将返回结果转换ViewController可以处理的model -----
- (id)assembleResponseModel:(id)responseObject{
    NSError *error;
    AppModel *model = [AppModel objectWithKeyValues:[responseObject objectForKey:@"app"] error:&error];
    return model;
}


@end
