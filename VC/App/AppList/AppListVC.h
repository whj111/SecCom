//
//  AppListVC.h
//  SecCom
//
//  Created by libo on 4/21/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDetailVC.h"
#import "UserModel.h"
#import "AppModel.h"

@interface AppListVC : BaseViewController <UITableViewDelegate,
                                           UITableViewDataSource>


@property (strong, nonatomic) UserModel *userModel;
@property (nonatomic, strong) NSMutableArray *appArray;

- (void)requestAppList;

@end
