

#import "EVCircularProgressView.h"

#define DEGREES_TO_RADIANS(x) (x)/180.0*M_PI
#define RADIANS_TO_DEGREES(x) (x)/180.0*M_PI



@implementation EVCircularProgressView



- (void)commonInit{
    
    _shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.fillColor = nil;
    _shapeLayer.strokeColor = self.progressTintColor.CGColor;
    
    [self.layer addSublayer:_shapeLayer];
    
//    [self startIndeterminateAnimation];
}

- (void)setProgressTintColor:(UIColor *)progressTintColor{
    if ([self respondsToSelector:@selector(setTintColor:)]) {
        self.tintColor = progressTintColor;
    } else {
        self.progressTintColor = progressTintColor;
        [self tintColorDidChange];
    }
}

- (UIColor *)progressTintColor{
    if ([self respondsToSelector:@selector(tintColor)]) {
        return self.tintColor;
    } else {
        return self.progressTintColor;
    }
}

- (void)tintColorDidChange{
    self.shapeLayer.strokeColor = self.progressTintColor.CGColor;
}

- (void)startIndeterminateAnimation{
    if (_isAnimating) {
        return;
    }
    _isAnimating = YES;

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    
    self.shapeLayer.lineWidth = 5;
    self.shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                          radius:self.bounds.size.width - 1
                                                      startAngle:DEGREES_TO_RADIANS(348)
                                                        endAngle:DEGREES_TO_RADIANS(300)
                                                       clockwise:NO].CGPath;
    self.shapeLayer.strokeEnd = 1;
    
    [CATransaction commit];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2*M_PI];
    rotationAnimation.duration = 1.5;
    rotationAnimation.repeatCount = HUGE_VALF;

    [self.shapeLayer addAnimation:rotationAnimation forKey:@"indeterminateAnimation"];
}

- (void)runloopTimer{
    self.shapeLayer.lineWidth = 5;
    self.shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                          radius:self.bounds.size.width - 1
                                                      startAngle:DEGREES_TO_RADIANS(348)
                                                        endAngle:DEGREES_TO_RADIANS(300)
                                                       clockwise:NO].CGPath;
    self.shapeLayer.strokeEnd = 1;
    NSTimer *updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f
                                                            target:self
                                                          selector:@selector(runloopAnimation)
                                                          userInfo:nil
                                                           repeats:YES];
    
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    [runloop addTimer:updateTimer forMode:NSRunLoopCommonModes];
}

- (void)runloopAnimation{
    self.transform = CGAffineTransformRotate(self.transform, 2*M_PI);
}


- (void)stopIndeterminateAnimation{
    [self.shapeLayer removeAnimationForKey:@"indeterminateAnimation"];
    _isAnimating = NO;
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    [CATransaction commit];
}

@end
