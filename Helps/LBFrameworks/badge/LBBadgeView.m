//
//  LBBageView.m
//  test
//
//  Created by libo on 12/12/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "LBBadgeView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation LBBadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        _label.font = [UIFont systemFontOfSize:18];
        
        _badgeColor = UIColorFromRGB(0x63a7f4);
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGFloat fontSize = 16;
    CGSize numberSize = [self.badgeString sizeWithFont:[UIFont boldSystemFontOfSize:fontSize]];
//    CGRect bounds = CGRectMake(0, 0, numberSize.width, rect.size.height);
    CGRect bounds = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGFloat radius = (self.radius)? self.radius:self.frame.size.height/2;
    UIColor *color = (self.badgeColor)? self.badgeColor : [UIColor redColor];
    // bounds for the text label
    bounds.origin.x = 4.5;
    bounds.origin.y = -2;

    _label.frame = CGRectMake(0, 1, self.frame.size.width, self.frame.size.height);
    _label.text = self.badgeString;
    
    CALayer *badge = [CALayer layer];
    [badge setFrame:rect];
    
    CGSize imageSize = badge.frame.size;
    
//    // retian
//    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES && [[UIScreen mainScreen] scale] == 2.00)
//    {
//        imageSize = CGSizeMake(badge.frame.size.width * 2, badge.frame.size.height * 2);
//        [badge setFrame:CGRectMake(badge.frame.origin.x,
//                                     badge.frame.origin.y,
//                                     badge.frame.size.width*2,
//                                     badge.frame.size.height*2)];
//        fontSize = (fontSize * 2);
//        bounds.origin.x = ((bounds.size.width * 2) - (numberSize.width * 2)) / 2.0f + 1;
//        bounds.origin.y += 3;
//        bounds.size.width = bounds.size.width * 2;
//        radius = radius * 2;
//    }
    

    
    [badge setBackgroundColor:[color CGColor]];
    [badge setCornerRadius:radius];
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [badge renderInContext:context];
    CGContextRestoreGState(context);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    
//    [self.badgeString drawInRect:bounds withFont:[UIFont boldSystemFontOfSize:fontSize] lineBreakMode:UILineBreakModeClip];
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [outputImage drawInRect:rect];
}

- (void)setNumber:(NSInteger)number
{
    _badgeString = [NSString stringWithFormat:@"%d",number];
    
    CGSize badgeSize = [_badgeString sizeWithFont:[UIFont boldSystemFontOfSize: 11]];
    CGRect badgeframe = CGRectMake(self.frame.origin.x,
                                   self.frame.origin.y,
                                   badgeSize.width + 13,
                                   20);
    
    
    [self setFrame:badgeframe];
    [self setNeedsDisplay];
}


@end











