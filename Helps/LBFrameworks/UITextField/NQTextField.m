//
//  NQTextField.m
//  NQYoungCloud
//
//  Created by libo on 14-8-22.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "NQTextField.h"
#import "UtilsMacro.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation NQTextField

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
- (void)drawPlaceholderInRect:(CGRect)rect
{

    [UIColorFromRGB(0xaeb5bb) setFill];
//        [[UIColor redColor] setFill];
    
//    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:20]];
}



@end
