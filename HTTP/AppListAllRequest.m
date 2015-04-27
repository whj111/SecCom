//
//  AppListAllRequest.m
//  SecCom
//
//  Created by libo on 4/21/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "AppListAllRequest.h"
#import "AppModel.h"

@implementation AppListAllRequest


- (NSString *)requestURL{
    return [RequestURL urlWithTpye:UrlTypeApplistAll];
}

+ (NSDictionary *)HTTPHeader{
    return nil;
}

#pragma mark ----- 将返回结果转换ViewController可以处理的model -----
- (id)assembleResponseModel:(id)responseObject{
    
//    NSMutableArray *testArr = [[NSMutableArray alloc] init];
//    for (int i=0; i<10; i++) {
//        AppModel *model = [[AppModel alloc] init];
//        model.title = [NSString stringWithFormat:@"第%d个app",i];
//        [testArr addObject:model];
//    }
//    return [NSArray arrayWithArray:testArr];
    
    
    NSArray *arr = [responseObject objectForKey:@"appList"];
    NSError *error;
    NSArray *appArray = [AppModel objectArrayWithKeyValuesArray:arr];
    
    if (!error) {
        return appArray;
    }else{
        NSLog(@"%@",error.localizedDescription);
        return nil;
    }
}

#pragma mark ----- 处理请求失败 -----
- (NSString *)handleRequestError:(id)responseObject{
    responseModel *model = [[responseObject objectForKey:@"response"] objectForKey:@"result"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [tools showMessage:model.message];
    });
    return model.message;
}


@end
