//
//  UILabelCenter.h
//  NQYoungCloud
//
//  Created by libo on 14-7-28.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VerticalAlignment) {
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
};

@interface UILabelCenter : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;


@end
