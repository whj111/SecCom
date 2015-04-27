//
//  coinAnimationView.h
//  test
//
//  Created by libo on 14-8-20.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface coinAnimationView : UIView

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, assign) CGFloat duration;



- (id)initWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView;

- (id)initWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView duration:(CGFloat)duration;

- (void)coinAnimation;

@end
