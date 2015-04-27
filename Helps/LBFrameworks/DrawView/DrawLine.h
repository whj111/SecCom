//
//  DrawLine.h
//  ShaoNianPai
//
//  Created by libo on 12/14/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawLine : UIView

@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, strong) UIColor *color;

/*
 * 有可能画的是斜线，所以不填充view
 */
- (void)drawLineBegin:(CGPoint)beginPoint endPoint:(CGPoint)endPoint color:(UIColor *)color;

@end
