//
//  UITextField_custom.m
//  NQYoungCloud
//
//  Created by libo on 14-7-25.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "UITextField_custom.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UITextField_custom

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)drawPlaceholderInRect:(CGRect)rect{
    UIColor *color = UIColorFromRGB(0x8d9398);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    [[UIColor orangeColor] setFill];
    
//    [[selfplaceholder] drawInRect:rectwithFont:[UIFontsystemFontOfSize:20]];
}


@end
