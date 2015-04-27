//
//  UIButton_State.h
//  frameCollection
//
//  Created by libo on 14-8-25.
//  Copyright (c) 2014年 NQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^defaultButtonTouchupIndeBlock) (void);
typedef void (^selectedButtonTouchupIndeBlock) (void);
typedef void (^DefaultChangeBlock) (BOOL *change);
typedef void (^SelectedChangeBlock) (BOOL *change);



@interface UIButton_State : UIButton


@property (nonatomic, assign) BOOL selectedState;

@property (nonatomic, strong) UIImage *defaultNormalImage;
@property (nonatomic, strong) UIImage *defaultHighlightedImage;
@property (nonatomic, strong) UIImage *selectedNormalImage;
@property (nonatomic, strong) UIImage *selectedHighlightedImage;

@property (nonatomic, assign) SEL defaultButtonTouchupInsideAction;
@property (nonatomic, assign) SEL selectedButtonTouchupInsideAction;

@property (nonatomic, copy) defaultButtonTouchupIndeBlock defaultBlock;
@property (nonatomic, copy) selectedButtonTouchupIndeBlock selectedBlock;
@property (nonatomic, copy) DefaultChangeBlock defaultChangeBlock;
@property (nonatomic, copy) SelectedChangeBlock selectedChangeBlock;

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
                defaultHeightImage:(NSString *)defaultHighlightedImage
               selectedNormalImage:(NSString *)selectedNormalImage
             selectedHeightedImage:(NSString *)selectedHighlightedImage;

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
                defaultHeightImage:(NSString *)defaultHighlightedImage
               selectedNormalImage:(NSString *)selectedNormalImage
             selectedHeightedImage:(NSString *)selectedHighlightedImage
   defaultButtonTouchupInsideBlock:(defaultButtonTouchupIndeBlock)defaultBlock
  selectedButtonTouchupInsideBlock:(selectedButtonTouchupIndeBlock)selectedBlock;

- (void)setDefaultButtonTouchupInsideBlock:(defaultButtonTouchupIndeBlock)defaultBlock
          selectedButtonTouchupInsideBlock:(selectedButtonTouchupIndeBlock)selectedBlock;

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
           defaultHeightImage:(NSString *)defaultHighlightedImage
          selectedNormalImage:(NSString *)selectedNormalImage
        selectedHeightedImage:(NSString *)selectedHighlightedImage
           defaultButtonBlock:(void (^) (BOOL *change))defaultBlock
          selectedButtonBlock:(void (^) (BOOL *change))selectedBlock;



@end
