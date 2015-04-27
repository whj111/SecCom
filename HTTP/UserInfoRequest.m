//
//  UserInfoRequest.m
//  SecCom
//
//  Created by libo on 4/22/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "UserInfoRequest.h"

@implementation UserInfoRequest

- (NSString *)requestURL{
    return [RequestURL urlWithTpye:UrlTypeUserInfo];
}

@end
