//
//  LoginRequest.m
//  SecCom
//
//  Created by libo on 4/20/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest


- (NSString *)requestURL{
    return [RequestURL urlWithTpye:UrlTypeLogin];
}

+ (NSDictionary *)HTTPHeader{
    return nil;
}

#pragma mark ----- 将返回结果转换ViewController可以处理的model -----
- (id)assembleResponseModel:(id)responseObject{
    return responseObject;
}

#pragma mark ----- 处理请求失败 -----
- (NSString *)handleRequestError:(id)responseObject{
    dispatch_async(dispatch_get_main_queue(), ^{
        //统一弹出提示框
    });
    return [responseObject objectForKey:@"return_type"];
}

#pragma mark -----  对请求失败进行处理 -----
- (NSString *)handleErrorMessage:(NSError *)error{
    return error.localizedDescription;
}

@end
