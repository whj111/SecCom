//
//  PopoerView.m
//  test
//
//  Created by libo on 11/26/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import "PopoverView.h"

extern CGFloat const POPcellHeight;

@implementation PopoverView

- (id)initWithFrame:(CGRect)frame titles:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.backgroundImageView];
        
        self.titles = array;
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = self.titles[0];
        [self addSubview:self.titleLabel];
        self.title = self.titles[0];
        
        self.btn = [[UIButton alloc] initWithFrame:self.bounds];
        [self.btn addTarget:self action:@selector(menuBtnTouched) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
        
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

- (void)menuBtnTouched
{
    __weak typeof(self)weakSelf = self;
    _tableView = [[PopoverTable alloc] init];
    _tableView.dataArray = self.titles;
//    _tableView.tableView.scrollEnabled = NO;
    _tableView.cellSelect = ^(NSInteger index){
        [weakSelf.popover dismissPopoverAnimated:YES];
        weakSelf.title = weakSelf.titles[index];
        if (weakSelf.selectAtIndex) {
            weakSelf.selectAtIndex(index);
        }
    };
    _popover = [[UIPopoverController alloc] initWithContentViewController:_tableView];
    _popover.delegate = self;
    _popover.popoverContentSize = CGSizeMake(200, POPcellHeight*self.titles.count);
    [_popover presentPopoverFromRect:(CGRect){self.frame.size.width/2, 30, 1, 1}
                             inView:self
           permittedArrowDirections:UIPopoverArrowDirectionDown|UIPopoverArrowDirectionUp
                           animated:YES];
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    _popover = nil;
}


@end
