//
//  ScrollView3.m
//  ShaoNianPai
//
//  Created by libo on 14/11/12.
//  Copyright (c) 2014年 LB. All rights reserved.
//

#import "ScrollView3.h"

#define WIDTH self.frame.size.width

@implementation ScrollView3

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor grayColor];
        [self addSubview:_scrollView];
        
        _array = [[NSMutableArray alloc] init];
        _URLArray = [[NSMutableArray alloc] init];
    }
    return self;
}
// tag 1,2,3
- (void)setImageWithTag:(NSInteger)tag InURLArray:(NSMutableArray *)array{
    [_array removeAllObjects];
    if (tag < 1) {
        tag = 1;
    }
    _currentTag = tag;
    _URLArray = array;
    for (ScrollImageView *aview in _scrollView.subviews) {
        [aview.imageView sd_setImageWithURL:nil];
        [aview removeFromSuperview];
    }
    [_scrollView setContentSize:(CGSize){_URLArray.count*WIDTH, self.frame.size.height}];
    [_scrollView setContentOffset:(CGPoint){WIDTH*(tag-1), 0}];
    if (tag == 1) {
        NSInteger count = 3>=array.count? array.count:3;
        for (int i=0; i<count; i++) {
            ScrollImageView *imageView = [[ScrollImageView alloc] initWithFrame:(CGRect){i*WIDTH, 0, self.frame.size}];
            [_scrollView addSubview:imageView];
            [_array addObject:imageView];
            [self setImageView:imageView WithURL:_URLArray[i]];
        }
    }else if (tag == array.count){
        NSInteger count = 3>=array.count? array.count:3;
        for (int i=0; i<count; i++) {
            ScrollImageView *imageView = [[ScrollImageView alloc] initWithFrame:(CGRect){WIDTH*(_URLArray.count-(i+1)), 0, self.frame.size}];
            [_scrollView addSubview:imageView];
            [self setImageView:imageView WithURL:_URLArray[_URLArray.count-(i+1)]];
            [_array insertObject:imageView atIndex:0];
        }
    }else if (tag == 0){
    
    }else{
        ScrollImageView *imageView1 = [[ScrollImageView alloc] initWithFrame:(CGRect){(tag-2)*WIDTH, 0, self.frame.size}];
        [_scrollView addSubview:imageView1];
        [self setImageView:imageView1 WithURL:_URLArray[tag-2]];
        [_array addObject:imageView1];
        
        ScrollImageView *imageView2 = [[ScrollImageView alloc] initWithFrame:(CGRect){(tag-1)*WIDTH, 0, self.frame.size}];
        [_scrollView addSubview:imageView2];
        [self setImageView:imageView2 WithURL:_URLArray[tag-1]];
        [_array addObject:imageView2];
        
        ScrollImageView *imageView3 = [[ScrollImageView alloc] initWithFrame:(CGRect){(tag)*WIDTH, 0, self.frame.size}];
        [_scrollView addSubview:imageView3];
        [self setImageView:imageView3 WithURL:_URLArray[tag]];
        [_array addObject:imageView3];
    }
}

#pragma mark ---------- UIScrollViewDelegate -------------
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!_array || _array.count == 0) {
        return;
    }
    // 控制在页面转到50％的时候设定加载新内容
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
//    NSLog(@"%d",page);
    if (_currentTag !=1 && _currentTag<page && page<(_URLArray.count)) {//显示右边图片
        ScrollImageView *imageView = _array[0];
        [imageView setFrame:(CGRect){(page)*WIDTH, 0, self.frame.size}];
        [self setImageView:imageView WithURL:_URLArray[page]];
        [_array removeObjectAtIndex:0];
        [_array addObject:imageView];
    }else if (_currentTag != _URLArray.count && _currentTag>page && page>1){
        ScrollImageView *imageView = [_array lastObject];
        [imageView setFrame:(CGRect){(page-2)*WIDTH, 0, self.frame.size}];
        [self setImageView:imageView WithURL:_URLArray[page-2]];
        [_array removeLastObject];
        [_array insertObject:imageView atIndex:0];
    }
    _currentTag = page;
    if (_currentIndexBlock) {
        _currentIndexBlock(page);
    }
}

- (void)setImageView:(ScrollImageView *)scrollImage WithURL:(NSString *)url{
    [scrollImage.imageView cancelCurrentImageLoad];
    [scrollImage.imageView cancelCurrentArrayLoad];
    
    [MBProgressHUD hideHUDForView:scrollImage animated:YES];
    [MBProgressHUD showHUDAddedTo:scrollImage animated:YES];

    [scrollImage.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                             placeholderImage:[UIImage imageNamed:@"unDownload.png"]
                                      options:SDWebImageDelayPlaceholder
                                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                        if (error) {
                                            NSLog(@"%@",error);
                                            [[SDImageCache sharedImageCache] removeImageForKey:url];
                                        }else{
                                            scrollImage.downloadDone = YES;
                                            [scrollImage adjustFrame];
                                        }
                                        [MBProgressHUD hideHUDForView:scrollImage animated:YES];
                                        if (_scrollView.contentOffset.y<0) {
                                            
                                            CGSize size = _scrollView.contentSize;
                                            size.height = size.height - 20;
                                            _scrollView.contentSize = size;
                                            
                                            CGPoint point = _scrollView.contentOffset;
                                            point.y = 0;
                                            _scrollView.contentOffset = point;
                                        }
                                    }];
}

- (UIImage *)currentImage{
    NSLog(@"%f",WIDTH*(_currentTag-1));
    for (ScrollImageView *imageView in _array) {
        if (imageView.frame.origin.x == WIDTH*(_currentTag-1)) {
            if (imageView.downloadDone) {
                return imageView.imageView.image;
            }
        }
    }

    return nil;
}

- (void)deleteImageWithTag:(NSInteger)tag{
    if (_URLArray.count<tag || _URLArray.count==0 || !_URLArray.count) {
        return;
    }
    
    [_URLArray removeObjectAtIndex:(tag)];
    if (_URLArray.count > 0) {
        _currentTag = _currentTag>_URLArray.count? _URLArray.count:_currentTag;
        [self setImageWithTag:_currentTag InURLArray:_URLArray];
    }else{
    
    }
}

- (void)dealloc{}


@end
