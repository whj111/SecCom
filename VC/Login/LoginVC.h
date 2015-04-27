//
//  LoginVC.h
//  SecCom
//
//  Created by duanran on 15/4/21.
//  Copyright (c) 2015年 LB. All rights reserved.
//

#import "BaseViewController.h"
#import "SlideNavigationController.h"

@interface LoginVC : BaseViewController<SlideNavigationControllerDelegate>
@property(nonatomic,strong)SlideNavigationController *mySliderNavigationContorller;

@end
