//
//  ScrollImageView.h
//  NQYoungCloud
//
//  Created by libo on 14-7-17.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ScrollImageView : UIScrollView <UIScrollViewDelegate>


@property (nonatomic, assign) BOOL downloadDone;
@property (nonatomic, assign) BOOL doubleTap;

@property (nonatomic, assign) UIImage *image;

@property (nonatomic, strong) UIImageView *imageView;

- (void)adjustFrame;


@end
