//
//  LeftVC.m
//  SecCom
//
//  Created by duanran on 15/4/21.
//  Copyright (c) 2015年 LB. All rights reserved.
//

#import "LeftVC.h"
#import "HomeViewController.h"
#import "SettingVC.h"

@interface LeftVC ()

@end

@implementation LeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu.jpg"]];
    self.tableView.backgroundView = imageView;
    self.view.layer.borderWidth = .6;
    self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
}
#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *idetifier=@"leftMenuCell";
    UITableViewCell *cell=nil;
    
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
        
    }
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Home";
            break;
            
        case 1:
            cell.textLabel.text = @"Setting";
            break;
            
        case 2:
            cell.textLabel.text = @"Friends";
            break;
            
        case 3:
            cell.textLabel.text = @"Sign Out";
            break;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *vc ;
    
    if (indexPath.row==0) {
        vc = [[HomeViewController alloc] init];
    }else if(indexPath.row==1){
        vc = [[SettingVC alloc] init];
    }else if (indexPath.row==2){

    }else{
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
        [[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
    }
    
    
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
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
