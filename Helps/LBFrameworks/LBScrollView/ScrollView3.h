//
//  ScrollView3.h
//  ShaoNianPai
//
//  Created by libo on 14/11/12.
//  Copyright (c) 2014年 LB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollImageView.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

typedef void(^CurrentIndexBlock)(NSInteger tag);

@interface ScrollView3 : UIView <UIScrollViewDelegate>

@property (nonatomic, copy) CurrentIndexBlock currentIndexBlock;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *URLArray;

@property (nonatomic, assign) NSInteger currentTag;


- (void)setImageWithTag:(NSInteger)tag InURLArray:(NSMutableArray *)array;

- (UIImage *)currentImage;

- (void)deleteImageWithTag:(NSInteger)tag;

@property (nonatomic, strong) ScrollImageView *imageView1;
@property (nonatomic, strong) ScrollImageView *imageView2;
@property (nonatomic, strong) ScrollImageView *imageView3;



@end
