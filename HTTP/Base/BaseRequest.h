//
//  BaseRequest.h
//  SecCom
//
//  Created by libo on 4/20/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "tools.h"
#import "RequestURL.h"
#import "BaseModel.h"
#import "responseModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "MJExtension.h"
#import "responseModel.h"

/* 请求成功 block */
typedef void(^successHandler)(id responseObject);
/* 请求失败 block */
typedef void(^failureHandler)(NSString *errorMessage);
/* HTTP请求失败 block */
typedef void(^HTTPFailure)(NSError *error);

@interface BaseRequest : NSObject

/* 设置请求的暂停、开始 获取请求、下载进度 */
@property (nonatomic, strong) AFHTTPRequestOperation *operation;

/* requestURL */
@property (nonatomic, strong) NSString *requestURL;

/* 设置HTTP头 */
@property (nonatomic, strong) NSDictionary *HTTPHeader;

/* 各接口请求数据的不同参数 */
@property (nonatomic,strong)NSDictionary *parameters;

@property (nonatomic, copy) successHandler success;
@property (nonatomic, copy) failureHandler failure;
@property (nonatomic, copy) HTTPFailure httpFailure;



-(AFHTTPRequestOperation *)GETRequest:(successHandler)success Failure:(failureHandler)failure;
-(AFHTTPRequestOperation *)POSTRequest:(successHandler)success Failure:(failureHandler)failure;

/* 请求成功 */
- (id)assembleResponseModel:(id)responseObject;

/* 请求失败 */
- (NSString *)handleRequestError:(id)responseObject;

/* 网络请求失败 */
- (NSString *)handleErrorMessage:(NSError *)error;


@end
