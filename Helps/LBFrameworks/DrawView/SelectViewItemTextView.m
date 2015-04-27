//
//  SelectViewItemTextView.m
//  ShaoNianPai
//
//  Created by libo on 12/17/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "SelectViewItemTextView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation SelectViewItemTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textView = [[UITextView alloc] initWithFrame:(CGRect){0, 0, 100, 60}];
        _textView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:_textView];
        
        _textView.textAlignment = NSTextAlignmentCenter;
        _textView.textColor = UIColorFromRGB(0x5a6175);
        _textView.backgroundColor = [UIColor clearColor];
        _textView.userInteractionEnabled = NO;
        _textView.font = [UIFont systemFontOfSize:17];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)btnAction
{
    if (self.tapBtnTaped) {
        self.tapBtnTaped (self.tag);
    }
    [self btnCancel];
}

- (void)btnTouchedDown
{
    [self.circle setColor:UIColorFromRGB(0x86d746)];
    _textView.backgroundColor = UIColorFromRGB(0x86d746);
    _textView.textColor = UIColorFromRGB(0xffffff);
}

- (void)btnCancel
{
    [self.circle setColor:UIColorFromRGB(0xffffff)];
    _textView.backgroundColor = UIColorFromRGB(0xffffff);
    _textView.textColor = UIColorFromRGB(0x5a6175);
}




@end
