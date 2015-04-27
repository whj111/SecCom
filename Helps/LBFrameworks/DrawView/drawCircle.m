//
//  drawView.m
//  test
//
//  Created by libo on 12/11/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "drawCircle.h"

@implementation drawCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //填充圆，无边框
    CGContextSetFillColorWithColor(context, _color.CGColor);//填充颜色
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    [self setNeedsDisplay];
}


@end
