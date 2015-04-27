//
//  coinAnimationView.m
//  test
//
//  Created by libo on 14-8-20.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "coinAnimationView.h"

#define durationDefault 0.7

@implementation coinAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView{
    return [self initWithFrame:frame firstView:firstView secondView:secondView duration:durationDefault];
}

- (id)initWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView duration:(CGFloat)duration{
    self = [super initWithFrame:frame];
    if (self) {
        _firstView = firstView;
        _secondView = secondView;
        _duration = duration;
        
        [self addSubview:_firstView];
        [self addSubview:_secondView];
        _secondView.hidden = YES;
    }
    return self;
}

- (void)coinAnimation{
    static int count = 0;
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = _duration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"oglFlip";
    if (count%2 == 0) {
        animation.subtype = kCATransitionFromRight;
    }else{
        animation.subtype = kCATransitionFromLeft;
    }
    count ++;
    
    NSUInteger first = [[self subviews] indexOfObject:_firstView];
    NSUInteger second = [[self subviews] indexOfObject:_secondView];
    [self exchangeSubviewAtIndex:second withSubviewAtIndex:first];
    [[self layer] addAnimation:animation forKey:@"animation"];
    [self hiddenExchange];
}

- (void)hiddenExchange{
    if (_firstView.hidden == YES) {
        [self performSelector:@selector(hiddenSecondView) withObject:nil afterDelay:_duration/2];
    }else{
        [self performSelector:@selector(hiddenFirstView) withObject:nil afterDelay:_duration/2];
    }
}

- (void)hiddenFirstView{
    _firstView.hidden = YES;
    _secondView.hidden = NO;
}

- (void)hiddenSecondView{
    _firstView.hidden = NO;
    _secondView.hidden = YES;
}




@end
