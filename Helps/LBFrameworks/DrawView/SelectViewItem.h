//
//  SelectViewItem.h
//  animation
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "drawCircle.h"

typedef void(^TapBtnTaped)(NSInteger index);

@interface SelectViewItem : UIView

@property (nonatomic, copy) TapBtnTaped tapBtnTaped;

@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) drawCircle *circle;
@property (nonatomic, assign) float radius;
@property (nonatomic, assign) float diameter;
@property (nonatomic, assign) CGPoint viewCenter;
@property (nonatomic, assign) CGPoint subTitleCenter;
@property (nonatomic, assign) CGPoint titleCenter;



@end
