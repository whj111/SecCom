//
//  AppListInstalled.m
//  SecCom
//
//  Created by libo on 4/22/15.
//  Copyright (c) 2015 LB. All rights reserved.
//

#import "AppListInstalled.h"
#import "AppListInstalledRequest.h"

@interface AppListInstalled ()

@end

@implementation AppListInstalled

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)requestAppList{
    AppListInstalledRequest *request = [[AppListInstalledRequest alloc] init];
    [request POSTRequest:^(id responseObject) {
        
    } Failure:^(NSString *errorMessage) {
        
    }];
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

@end
