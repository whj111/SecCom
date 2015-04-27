//
//  LBProgressView.m
//  ShaoNianPai
//
//  Created by libo on 11/17/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "LBProgressView.h"

@implementation LBProgressView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0.0f;
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
    
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [_lineColor CGColor]);
    CGContextSetFillColorWithColor(context, [_progressRemainingColor CGColor]);

    
    float rWIDTH = rect.size.width;
    float rHEIGHT = rect.size.height;
    float radius = (rHEIGHT/2) - 2;
    
    // Draw background
    CGContextMoveToPoint(context, 2, rHEIGHT/2);
    CGContextAddArcToPoint(context, 2, 2, radius + 2, 2, radius);//四分之一圆
    CGContextAddLineToPoint(context, rWIDTH, 2);
    CGContextAddArcToPoint(context, rWIDTH - 2, 2, rWIDTH - 2, rHEIGHT/2, radius);
    CGContextAddArcToPoint(context, rWIDTH - 2, rHEIGHT - 2, rWIDTH - radius - 2, rHEIGHT - 2, radius);
    CGContextAddLineToPoint(context, radius + 2, rHEIGHT - 2);
    CGContextAddArcToPoint(context, 2, rHEIGHT - 2, 2, rHEIGHT/2, radius);
    CGContextFillPath(context);
    
    // Draw border
    CGContextMoveToPoint(context, 2, rHEIGHT/2);
    CGContextAddArcToPoint(context, 2, 2, radius + 2, 2, radius);
    CGContextAddLineToPoint(context, rWIDTH - radius - 2, 2);
    CGContextAddArcToPoint(context, rWIDTH - 2, 2, rWIDTH - 2, rHEIGHT/2, radius);
    CGContextAddArcToPoint(context, rWIDTH - 2, rHEIGHT - 2, rWIDTH - radius - 2, rHEIGHT - 2, radius);
    CGContextAddLineToPoint(context, radius + 2, rHEIGHT - 2);
    CGContextAddArcToPoint(context, 2, rHEIGHT - 2, 2, rHEIGHT/2, radius);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [_progressColor CGColor]);
    radius = radius - 2;
    float amount = self.progress * rWIDTH;
    
    // Progress is in the left arc 左边半圆区域内
    if (amount < (radius + 4) && amount > 0) {
        CGContextMoveToPoint(context, 4, rHEIGHT/4);
        CGContextAddArcToPoint(context, 4, 4, radius + 4, 4, radius);
        CGContextAddLineToPoint(context, radius + 4, rHEIGHT/2);
        
        CGContextMoveToPoint(context, 4, rHEIGHT/2);
        CGContextAddArcToPoint(context, 4, rHEIGHT - 4, radius + 4, rHEIGHT - 4, radius);
        CGContextAddLineToPoint(context, radius + 4, rHEIGHT/2);
        
        CGContextFillPath(context);
    }
    // Progress in the middle area 完全平行区域
    else if (amount >= (radius + 4) && amount <= (rWIDTH - radius - 4)) {
        CGContextMoveToPoint(context, 4, rHEIGHT/2);
        CGContextAddArcToPoint(context, 4, 4, radius + 4, 4, radius);
        CGContextAddLineToPoint(context, amount, 4);
        CGContextAddLineToPoint(context, amount, radius + 4);
       
        CGContextMoveToPoint(context, 4, rHEIGHT/2);
        CGContextAddArcToPoint(context, 4, rHEIGHT - 4, radius + 4, rHEIGHT - 4, radius);
        CGContextAddLineToPoint(context, amount, rHEIGHT - 4);
        CGContextAddLineToPoint(context, amount, radius + 4);
        
        CGContextFillPath(context);
    }
    // Progress in the right arc 右边半圆区域内
    else if (amount > radius + 4){
        float x = amount - (rWIDTH - radius - 4);
        
        CGContextMoveToPoint(context, 4, rHEIGHT/2);
        CGContextAddArcToPoint(context, 4, 4, radius + 4, 4, radius);
        CGContextAddLineToPoint(context, rWIDTH - radius - 4, 4);
        float angle = -acos(x/radius);
        if (isnan(angle)) {
            angle = 0;
        }
        CGContextAddArc(context, rWIDTH - radius - 4, rHEIGHT/2, radius, M_PI, angle, 0);
        CGContextAddLineToPoint(context, amount, rHEIGHT/2);
        
        CGContextMoveToPoint(context, 4, rHEIGHT/2);
        CGContextAddArcToPoint(context, 4, rHEIGHT - 4, radius + 4, rHEIGHT - 4, radius);
        CGContextAddLineToPoint(context, rWIDTH - radius - 4, rHEIGHT - 4);
        angle = acos(x/radius);
        if (isnan(angle)) {
            angle = 0;
        }
        CGContextAddArc(context, rWIDTH - radius - 4, rHEIGHT/2, radius, -M_PI, angle, 1);
        CGContextAddLineToPoint(context, amount, rHEIGHT/2);
        
        CGContextFillPath(context);
    }
}




@end
