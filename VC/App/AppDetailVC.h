//
//  AppDetailVC.h
//  SecCom
//
//  Created by libo on 4/21/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "BaseViewController.h"
#import "UserModel.h"
#import "AppModel.h"

@interface AppDetailVC : BaseViewController

@property (nonatomic, strong) AppModel *appModel;

@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@end
