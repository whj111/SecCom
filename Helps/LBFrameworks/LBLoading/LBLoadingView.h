//
//  LBLoadingView.h
//  TYDotIndicatorView
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 libo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LBLoadingView : UIView

/*
 * 动画块颜色
 */
@property (nonatomic, strong) UIColor *blockColor;

/*
 * 动画块数量
 */
@property (nonatomic, assign) NSInteger blockNumber;
@property (nonatomic, strong) NSMutableArray *blockArray;

/*
 * 动画块间隔
 */
@property (nonatomic, assign) float blockSeparator;

/*
 * 动画块大小
 */
@property (nonatomic, assign) CGSize blockSize;

/*
 * 动画是否在进行
 */
@property (nonatomic, assign, getter=isLoading) BOOL loading;


/*
 * 开始动画
 */
- (void)startAnimation;

/*
 * 停止动画
 */
- (void)stopAnimation;







@end




