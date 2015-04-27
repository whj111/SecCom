//
//  LeftVC.h
//  SecCom
//
//  Created by duanran on 15/4/21.
//  Copyright (c) 2015年 LB. All rights reserved.
//

#import "BaseViewController.h"

@interface LeftVC : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
@end
