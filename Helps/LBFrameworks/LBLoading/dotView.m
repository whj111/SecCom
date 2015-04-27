//
//  dotView.m
//  animation
//
//  Created by libo on 12/13/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "dotView.h"
#define PI 3.14159265358979323846

@implementation dotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _color = [UIColor blueColor];
        _diameter = frame.size.height;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //填充圆，无边框
//    CGContextSetFillColorWithColor(context, _color.CGColor);//填充颜色
//    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2, 0, 2*PI, 0); //添加一个圆
//    CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.color setFill];
    CGContextAddEllipseInRect(context,(CGRectMake (0, 0, _diameter, _diameter)));
    CGContextDrawPath(context, kCGPathFill);
    CGContextStrokePath(context);
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    [self setNeedsDisplay];
}


@end
