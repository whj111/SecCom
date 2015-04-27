//
//  DrawLine.m
//  ShaoNianPai
//
//  Created by libo on 12/14/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine

- (void)drawLineBegin:(CGPoint)beginPoint endPoint:(CGPoint)endPoint color:(UIColor *)color
{
    self.backgroundColor = [UIColor clearColor];
    _beginPoint = beginPoint;
    _endPoint = endPoint;
    _color = color;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
     //NO.1画一条线
     CGContextRef context = UIGraphicsGetCurrentContext();
//     CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextSetStrokeColorWithColor(context, _color.CGColor);
     CGContextMoveToPoint(context, _beginPoint.x, _beginPoint.y);
     CGContextAddLineToPoint(context, _endPoint.x, _endPoint.y);
     CGContextStrokePath(context);

}


@end
