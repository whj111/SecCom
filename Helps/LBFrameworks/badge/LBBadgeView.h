//
//  LBBageView.h
//  test
//
//  Created by libo on 12/12/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LBBadgeView : UIView

@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, strong) NSString *badgeString;
@property (nonatomic, strong) UIColor *badgeColor;
@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, assign) NSInteger number;


@end













