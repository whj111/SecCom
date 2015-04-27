//
//  LBLoadingView.h
//  animation
//
//  Created by libo on 12/13/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBDotLoadingView : UIView

@property (nonatomic, strong) NSMutableArray *dotsArray;

- (void)startAnimation;

- (void)stopAnimation;

@end
