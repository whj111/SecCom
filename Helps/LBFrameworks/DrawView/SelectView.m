//
//  SelectView.m
//  animation
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "SelectView.h"
#import "SelectViewItem.h"
#import "SelectViewItemTextView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define itemWidth  128

@implementation SelectView

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        _backButton = [[UIButton alloc] initWithFrame:self.bounds];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backButton.backgroundColor = UIColorFromRGB(0x000000);
        _backButton.alpha = 0.5f;
        [self addSubview:_backButton];
        
        _titleArray = [NSArray arrayWithArray:array];
        
    }
    
    return self;
}

- (void)startAnimation
{
    if (_titleArray.count == 1) {
        [self addItemAtPoint:CGPointMake(512, 374) delay:0.2 index:0];
    }else if (_titleArray.count == 2){
        if (_titleStyle == TitleSytleCenter) {
            [self addFourItemAtPoint:CGPointMake(404, 374) delay:0.1 index:0];
            [self addFourItemAtPoint:CGPointMake(620, 374) delay:0.3 index:1];
        }else{
            [self addItemAtPoint:CGPointMake(404, 374) delay:0.1 index:0];
            [self addItemAtPoint:CGPointMake(620, 374) delay:0.3 index:1];
        }
        
    }else if (_titleArray.count == 3){
        [self addItemAtPoint:CGPointMake(344, 374) delay:0.1 index:0];
        [self addItemAtPoint:CGPointMake(512, 374) delay:0.3 index:1];
        [self addItemAtPoint:CGPointMake(680, 374) delay:0.5 index:2];
    }else if (_titleArray.count == 4){
        [self addFourItemAtPoint:CGPointMake(188, 374) delay:0.1 index:0];
        [self addFourItemAtPoint:CGPointMake(404, 374) delay:0.2 index:1];
        [self addFourItemAtPoint:CGPointMake(620, 374) delay:0.3 index:2];
        [self addFourItemAtPoint:CGPointMake(836, 374) delay:0.4 index:3];
    }
}

- (void)addItemAtPoint:(CGPoint)point delay:(float)delay index:(NSInteger)index
{
    SelectViewItem *item = [[SelectViewItem alloc] initWithFrame:(CGRect){0,0,itemWidth,itemWidth}];
    item.center = point;
    item.subTitle = @"投递至";
    if (_subTitle.length > 0) {
        item.subTitle = _subTitle;
    }
    item.title = _titleArray[index];
    item.tag = index;
    item.alpha = 0.0f;
    [self addSubview:item];
    
    [CATransaction begin];
    {
        item.layer.transform = CATransform3DMakeScale(0.5f, 0.5f, 1.f);
    }
    [CATransaction commit];
    

    
    [UIView animateWithDuration:.8
                          delay:delay
         usingSpringWithDamping:0.4
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{

                         [CATransaction begin];
                         {
                             item.layer.transform = CATransform3DMakeScale(1.f, 1.f, 1.f);
                             item.alpha = 1.0f;
                         }
                         [CATransaction commit];
                     } completion:^(BOOL finished) {
                         
                     }];

    item.tapBtnTaped = ^(NSInteger index){
        if (self.selectAtIndex) {
            self.selectAtIndex (index);
//            NSLog(@"按下 %d",index);
            [self back];
        }
    };


}

- (void)addFourItemAtPoint:(CGPoint)point delay:(float)delay index:(NSInteger)index
{
    SelectViewItemTextView *item = [[SelectViewItemTextView alloc] initWithFrame:(CGRect){0,0,itemWidth,itemWidth}];
    item.center = point;
    
    item.textView.text = _titleArray[index];
    
    item.tag = index;
    item.alpha = 0.0f;
    [self addSubview:item];
    
    [CATransaction begin];
    {
        item.layer.transform = CATransform3DMakeScale(0.5f, 0.5f, 1.f);
    }
    [CATransaction commit];
    
    
    
    [UIView animateWithDuration:.8
                          delay:delay
         usingSpringWithDamping:0.4
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         [CATransaction begin];
                         {
                             item.layer.transform = CATransform3DMakeScale(1.f, 1.f, 1.f);
                             item.alpha = 1.0f;
                         }
                         [CATransaction commit];
                     } completion:^(BOOL finished) {
                         
                     }];
    
    item.tapBtnTaped = ^(NSInteger index){
        if (self.selectAtIndex) {
            self.selectAtIndex (index);
//            NSLog(@"按下 %d",index);
            [self back];
        }
    };
    
    
}

- (void)back
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self removeFromSuperview];
}

- (void)dealloc{}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
