//
//  PopoerView.h
//  test
//
//  Created by libo on 11/26/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverTable.h"

typedef void(^SelectAtIndex)(NSInteger index);

@interface PopoverView : UIView <UIPopoverControllerDelegate>

- (id)initWithFrame:(CGRect)frame titles:(NSArray *)array;

/*
 * 选中回调block
 */
@property (nonatomic, copy) SelectAtIndex selectAtIndex;

/*
 * 背景图片
 */
@property (nonatomic, strong) UIImageView *backgroundImageView;

/*
 * 存储数据内存
 */
@property (nonatomic, strong) NSArray *titles;

/*
 * 默认选中内容
 */
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

/*
 * 事件触发按钮
 */
@property (nonatomic, strong) UIButton *btn;

/*
 *  UIPopoverController
 */
@property (nonatomic, strong) UIPopoverController *popover;

/*
 * UITableView
 */
@property (nonatomic, strong) PopoverTable *tableView;

@end
