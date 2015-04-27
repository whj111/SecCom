//
//  LBProgressView.m
//  ShaoNianPai
//
//  Created by libo on 11/17/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "LBProgressBarView.h"

@implementation LBProgressBarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0.0f;
        _border = 1;
        _lineColor = [UIColor whiteColor];
        _progressColor = [UIColor blueColor];
        _progressRemainingColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        [self registerForKVO];
    }
    return self;
}

- (void)registerForKVO{
    for (NSString *keyPath in [self observebleKeypaths]) {
        [self addObserver:self
               forKeyPath:keyPath
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    }
}

- (void)unregisterFromKVO{
    for (NSString *keyPath in [self observebleKeypaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)observebleKeypaths{
    return @[@"lineColor",
             @"progressRemainingColor",
             @"progressColor",
             @"progress"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setNeedsDisplay];
}

- (void)dealloc{
    [self unregisterFromKVO];
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, _border);
    CGContextSetStrokeColorWithColor(context, [_lineColor CGColor]);
    CGContextSetFillColorWithColor(context, [_progressRemainingColor CGColor]);

    
    float rWIDTH = rect.size.width;
    float rHEIGHT = rect.size.height;
    float radius = (rHEIGHT/2) - _border;
    
    // Draw background
    CGContextMoveToPoint(context, _border, rHEIGHT/2);
    CGContextAddArcToPoint(context, _border, _border, radius + _border, _border, radius);//四分之一圆
    CGContextAddLineToPoint(context, rWIDTH, _border);
    CGContextAddArcToPoint(context, rWIDTH - _border, _border, rWIDTH - _border, rHEIGHT/2, radius);
    CGContextAddArcToPoint(context, rWIDTH - _border, rHEIGHT - _border, rWIDTH - radius - _border, rHEIGHT - _border, radius);
    CGContextAddLineToPoint(context, radius + _border, rHEIGHT - _border);
    CGContextAddArcToPoint(context, _border, rHEIGHT - _border, _border, rHEIGHT/2, radius);
    CGContextFillPath(context);
    
    // Draw border
    CGContextMoveToPoint(context, _border, rHEIGHT/2);
    CGContextAddArcToPoint(context, _border, _border, radius + _border, _border, radius);
    CGContextAddLineToPoint(context, rWIDTH - radius - _border, _border);
    CGContextAddArcToPoint(context, rWIDTH - _border, _border, rWIDTH - _border, rHEIGHT/2, radius);
    CGContextAddArcToPoint(context, rWIDTH - _border, rHEIGHT - _border, rWIDTH - radius - _border, rHEIGHT - _border, radius);
    CGContextAddLineToPoint(context, radius + _border, rHEIGHT - _border);
    CGContextAddArcToPoint(context, _border, rHEIGHT - _border, _border, rHEIGHT/2, radius);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [_progressColor CGColor]);
    radius = radius - _border;
    float amount = self.progress * rWIDTH;
    
    // Progress is in the left arc 左边半圆区域内
    if (amount < (radius + _border*2) && amount > 0) {
        CGContextMoveToPoint(context, _border, rHEIGHT/4);
        CGContextAddArcToPoint(context, 2*_border, 2*_border, radius + 2*_border, 2*_border, radius);
        CGContextAddLineToPoint(context, radius + 2*_border, rHEIGHT/2);
        
        CGContextMoveToPoint(context, 2*_border, rHEIGHT/2);
        CGContextAddArcToPoint(context, 2*_border, rHEIGHT - 2*_border, radius + 2*_border, rHEIGHT - 2*_border, radius);
        CGContextAddLineToPoint(context, radius + 2*_border, rHEIGHT/2);
        
        CGContextFillPath(context);
    }
    // Progress in the middle area 完全平行区域
    else if (amount >= (radius + 2*_border) && amount <= (rWIDTH - radius - 2*_border)) {
        CGContextMoveToPoint(context, 2*_border, rHEIGHT/2);
        CGContextAddArcToPoint(context, 2*_border, 2*_border, radius + 2*_border, 2*_border, radius);
        CGContextAddLineToPoint(context, amount, 2*_border);
        CGContextAddLineToPoint(context, amount, radius + 2*_border);
       
        CGContextMoveToPoint(context, 2*_border, rHEIGHT/2);
        CGContextAddArcToPoint(context, 2*_border, rHEIGHT - 2*_border, radius + 2*_border, rHEIGHT - 2*_border, radius);
        CGContextAddLineToPoint(context, amount, rHEIGHT - 2*_border);
        CGContextAddLineToPoint(context, amount, radius + 2*_border);
        
        CGContextFillPath(context);
    }
    // Progress in the right arc 右边半圆区域内
    else if (amount > radius + 2*_border){
        float x = amount - (rWIDTH - radius - 2*_border);
        
        CGContextMoveToPoint(context, 2*_border, rHEIGHT/2);
        CGContextAddArcToPoint(context, 2*_border, 2*_border, radius + 2*_border, 2*_border, radius);
        CGContextAddLineToPoint(context, rWIDTH - radius - 2*_border, 2*_border);
        float angle = -acos(x/radius);
        if (isnan(angle)) {
            angle = 0;
        }
        CGContextAddArc(context, rWIDTH - radius - 2*_border, rHEIGHT/2, radius, M_PI, angle, 0);
        CGContextAddLineToPoint(context, amount, rHEIGHT/2);
        
        CGContextMoveToPoint(context, 2*_border, rHEIGHT/2);
        CGContextAddArcToPoint(context, 2*_border, rHEIGHT - 2*_border, radius + 2*_border, rHEIGHT - 2*_border, radius);
        CGContextAddLineToPoint(context, rWIDTH - radius - 2*_border, rHEIGHT - 2*_border);
        angle = acos(x/radius);
        if (isnan(angle)) {
            angle = 0;
        }
        CGContextAddArc(context, rWIDTH - radius - 2*_border, rHEIGHT/2, radius, -M_PI, angle, 1);
        CGContextAddLineToPoint(context, amount, rHEIGHT/2);
        
        CGContextFillPath(context);
    }
}




@end
