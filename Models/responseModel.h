//
//  responseModel.h
//  SecCom
//
//  Created by libo on 4/24/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "BaseModel.h"

@interface responseModel : BaseModel


@property (nonatomic, strong, readonly) NSString *requestId;
@property (nonatomic, strong, readonly) NSString *code;
@property (nonatomic, strong, readonly) NSString *message;


@end
