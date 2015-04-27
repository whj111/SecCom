//
//  SelectViewItem.m
//  animation
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "SelectViewItem.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation SelectViewItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.radius = frame.size.height/2;
        self.diameter = frame.size.height;
        self.viewCenter = self.center;
        
        _circle = [[drawCircle alloc] initWithFrame:self.bounds];
        [self addSubview:_circle];
        [_circle setColor:UIColorFromRGB(0xffffff)];
        
        _subLabel = [[UILabel alloc] initWithFrame:(CGRect){0, 6, self.diameter, self.radius}];
        _subLabel.font = [UIFont systemFontOfSize:14];
        _subLabel.textColor = UIColorFromRGB(0xa7abb4);
        _subLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_subLabel];
        
        _label = [[UILabel alloc] initWithFrame:(CGRect){0, self.radius-20, self.diameter, self.radius}];
        _label.font = [UIFont boldSystemFontOfSize:15];
        _label.textColor = UIColorFromRGB(0x5a6175);
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        
        
        self.btn = [[UIButton alloc] initWithFrame:self.bounds];
        [self addSubview:self.btn];
        [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.btn addTarget:self action:@selector(btnTouchedDown) forControlEvents:UIControlEventTouchDown];
        [self.btn addTarget:self action:@selector(btnCancel) forControlEvents:UIControlEventTouchUpOutside];
    }
    
    return self;
}

- (void)setSubTitle:(NSString *)subTitle
{
    _subLabel.text = subTitle;
}

- (void)setTitle:(NSString *)title
{
    _label.text = title;
}

- (void)btnAction
{
    if (self.tapBtnTaped) {
        self.tapBtnTaped (self.tag);
    }
    [self btnCancel];
}

- (void)btnTouchedDown
{
    [_circle setColor:UIColorFromRGB(0x86d746)];
    _subLabel.textColor = UIColorFromRGB(0xffffff);
    _label.textColor = UIColorFromRGB(0xffffff);
}

- (void)btnCancel
{
    [_circle setColor:UIColorFromRGB(0xffffff)];
    _subLabel.textColor = UIColorFromRGB(0xa7abb4);
    _label.textColor = UIColorFromRGB(0x5a6175);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
