//
//  AppModel.h
//  SecCom
//
//  Created by libo on 4/21/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "BaseModel.h"


@interface AppModel : BaseModel

@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *appType;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *developer;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *updateDate;
@property (nonatomic, strong) NSString *packageName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *wifiDownload;
@property (nonatomic, strong) NSString *requiredOS;

@property (nonatomic, strong) NSArray *screenShots;

//@property (nonatomic, strong) NSString *description;


@end



