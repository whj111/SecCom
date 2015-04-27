//
//  LBLoadingView.m
//  TYDotIndicatorView
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 libo. All rights reserved.
//

#import "LBLoadingView.h"

@implementation LBLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _loading = NO;
        _blockArray = [[NSMutableArray alloc] init];
        _blockSize = CGSizeMake(10, 10);
        _blockColor = [UIColor blueColor];
        _blockSeparator = 8.0f;
        
    }

    return self;
}



- (void)setBlockColor:(UIColor *)blockColor
{
    _blockColor = blockColor;
    
}

- (void)setBlockNumber:(NSInteger)blockNumber
{
    _blockNumber = blockNumber;
    CGFloat xPos = CGRectGetWidth(self.frame)/2 - self.blockSize.width*blockNumber/2 - _blockSeparator;
    CGFloat yPoS = CGRectGetHeight(self.frame)/2 - self.blockSize.height/2;
    for (int i=0; i<blockNumber; i++) {
        CAShapeLayer *dot = [CAShapeLayer new];
        dot.path = [self createDotPath].CGPath;
        dot.frame = CGRectMake(xPos, yPoS, self.blockSize.width, self.blockSize.height);
        dot.opacity = (0.3)*i;
        dot.fillColor = _blockColor.CGColor;
        
        [self.layer addSublayer:dot];
        [_blockArray addObject:dot];
        xPos = xPos + (_blockSeparator + _blockSize.width);
    }
}

- (UIBezierPath *)createDotPath
{
    CGFloat cornerRadius = self.blockSize.width/2;
    UIBezierPath *bezerPath = [UIBezierPath bezierPathWithRoundedRect:(CGRect){0,0,self.blockSize}
                                                         cornerRadius:cornerRadius];
    return bezerPath;
}

- (CABasicAnimation *)scaleAnimation:(CFTimeInterval)delay
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(0.5);
    animation.toValue = @(1.0);
    animation.duration = 0.8;
    animation.beginTime = delay;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VAL;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

- (CAAnimation *)fadeInAnimation:(CFTimeInterval)delay
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0.3);
    animation.toValue = @(1.0f);
    animation.duration = 0.8;
    animation.beginTime = delay;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VAL;
    
    return animation;
}

- (void)startAnimation
{
    if (!self.blockNumber) {
        self.blockNumber = 3;
    }
    
    if (_loading) return;
    _loading = YES;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 1.0;
    }];
    
    for (int i=0; i<_blockNumber; i++) {
        [self.blockArray[i] addAnimation:[self fadeInAnimation:(i*0.2)] forKey:@"fadeIn"];
        [self.blockArray[i] addAnimation:[self scaleAnimation:(i*0.2)] forKey:@"scale"];
    }
}

- (void)stopAnimation
{
    if (!_loading) return;
    _loading = NO;
    
    for (int i=0; i<self.blockNumber; i++) {
        [self.blockArray[i] addAnimation:[self fadeInAnimation:(i*0.4)] forKey:@"fadeIn"];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (BOOL)isLoading
{
    return _loading;
}

- (void)removeFromSuperview
{
    [self stopAnimation];
    [super removeFromSuperview];
}

- (void)dealloc{}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
