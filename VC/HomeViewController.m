//
//  HomeViewController.m
//  SecCom
//
//  Created by duanran on 15/4/21.
//  Copyright (c) 2015年 LB. All rights reserved.
//

#import "HomeViewController.h"
#import "ApplistAll.h"
#import "AppListInstalled.h"
#import "AppListUnInstalled.h"
#import "UserInfoRequest.h"
#import "UserModel.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UserInfoRequest *request = [[UserInfoRequest alloc] init];
    [request GETRequest:^(id responseObject) {
        [self showUserInfo:responseObject];
    } Failure:^(NSString *errorMessage) {
        
    }];
}

/* 显示用户信息 */
- (void)showUserInfo:(UserModel *)user{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showAllAppList:(UIButton *)sender {
    ApplistAll *vc = [[ApplistAll alloc] initWithNibName:@"ApplistAll" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showInstalledApps:(UIButton *)sender {
    AppListInstalled *vc = [[AppListInstalled alloc] initWithNibName:@"AppListInstalled" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)showUnInstalledApps:(UIButton *)sender {
    AppListUnInstalled *vc = [[AppListUnInstalled alloc] initWithNibName:@"AppListUnInstalled" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
