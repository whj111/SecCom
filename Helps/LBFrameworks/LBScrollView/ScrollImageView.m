//
//  ScrollImageView.m
//  NQYoungCloud
//
//  Created by libo on 14-7-17.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import "ScrollImageView.h"
#import "UIImageView+WebCache.h"

@implementation ScrollImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];

        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
//        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//        singleTap.delaysTouchesBegan = YES;
//        singleTap.numberOfTapsRequired = 1;
//        [self addGestureRecognizer:singleTap];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
    }
    return self;
}

//设置缩放比例
- (void)adjustFrame{
    //基本尺寸
    CGSize boundsSize = self.bounds.size;
    CGFloat boundsWidth = boundsSize.width;
    
    CGSize imageSize = _imageView.image.size;
    CGFloat imageWidth = imageSize.width;
    
    //设置缩放比例
    CGFloat minSale = boundsWidth/imageWidth;
//    if (minSale > 1) {
        minSale = 1.0;
//    }
    CGFloat maxScale = 2.0;
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        maxScale = maxScale / [[UIScreen mainScreen] scale];
    }
    
    self.maximumZoomScale = maxScale;
    self.minimumZoomScale = minSale;
    self.zoomScale = minSale;
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return _imageView;
}

#pragma mark - 手势处理
- (void)handleSingleTap:(UITapGestureRecognizer *)tap {
    _doubleTap = NO;
    [self performSelector:@selector(hide) withObject:nil afterDelay:0.2];
}
- (void)hide
{
    if (_doubleTap) return;
    self.contentOffset = CGPointZero;
}


- (UIImage *)image{
    return _imageView.image;
}


- (void)reset
{
    _imageView.contentMode = UIViewContentModeScaleToFill;
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)tap {
    _doubleTap = YES;
    
    CGPoint touchPoint = [tap locationInView:self];
	if (self.zoomScale == self.maximumZoomScale) {
		[self setZoomScale:self.minimumZoomScale animated:YES];
	} else {
		[self zoomToRect:CGRectMake(touchPoint.x, touchPoint.y, 1, 1) animated:YES];
	}
}

- (void)dealloc
{
    // 取消请求
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@""]];
}


@end
