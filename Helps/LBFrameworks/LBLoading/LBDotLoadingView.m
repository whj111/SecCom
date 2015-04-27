//
//  LBLoadingView.m
//  animation
//
//  Created by libo on 12/13/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "LBDotLoadingView.h"
#import "dotView.h"

@implementation LBDotLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dotsArray = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            dotView *dot = [[dotView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
            [self addSubview:dot];
            dot.color = [UIColor blueColor];
            dot.center = CGPointMake(self.frame.size.width/2 + (i-1)*20, self.frame.size.height/2);
            [_dotsArray addObject:dot];
            NSLog(@"%f",dot.center.y);
        }
    }
    
    return self;
};

- (void)startAnimation
{
    for (int i=0; i<3; i++) {
        dotView *dot = self.dotsArray[i];

        [UIView animateWithDuration:1.2
                              delay:0.3*i
                            options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse
                         animations:^{
                             dot.alpha = 0.3;
                             dot.transform = CGAffineTransformMakeScale(0.3, 0.3);
                         } completion:^(BOOL finished) {
                             dot.transform = CGAffineTransformMakeScale(1, 1);
                             dot.alpha = 1.0f;
                         }];
    }
}

- (void)stopAnimation
{
    self.hidden = YES;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    for (int i=0; i<3; i++) {
        dotView *dot = self.dotsArray[i];
        [dot removeFromSuperview];
    }
    [self removeFromSuperview];
}

- (void)dealloc{}


@end
