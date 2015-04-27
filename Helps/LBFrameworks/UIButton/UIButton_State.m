//
//  UIButton_State.m
//  frameCollection
//
//  Created by libo on 14-8-25.
//  Copyright (c) 2014年 NQ. All rights reserved.
//


#import "UIButton_State.h"

@implementation UIButton_State

- (void)setSelectedState:(BOOL)selectedState{
    if (_selectedState == selectedState) {
        return;
    }
    
    _selectedState = selectedState;
    if (_selectedState) {
        [self setImage:self.selectedNormalImage forState:UIControlStateNormal];
        [self setImage:self.selectedHighlightedImage forState:UIControlStateHighlighted];
    }else{
        [self setImage:self.defaultNormalImage forState:UIControlStateNormal];
        [self setImage:self.defaultHighlightedImage forState:UIControlStateHighlighted];
    }
}

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
                defaultHeightImage:(NSString *)defaultHighlightedImage
               selectedNormalImage:(NSString *)selectedNormalImage
             selectedHeightedImage:(NSString *)selectedHighlightedImage{
    
    [self setDefaultNormalImage:defaultNormalImage
                  defaultHeightImage:defaultHighlightedImage
                 selectedNormalImage:selectedNormalImage
               selectedHeightedImage:selectedHighlightedImage
     defaultButtonTouchupInsideBlock:nil
    selectedButtonTouchupInsideBlock:nil];
}

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
                defaultHeightImage:(NSString *)defaultHighlightedImage
               selectedNormalImage:(NSString *)selectedNormalImage
             selectedHeightedImage:(NSString *)selectedHighlightedImage
   defaultButtonTouchupInsideBlock:(defaultButtonTouchupIndeBlock)defaultBlock
  selectedButtonTouchupInsideBlock:(selectedButtonTouchupIndeBlock)selectedBlock{
    
    self.defaultNormalImage = [UIImage imageNamed:defaultNormalImage];
    self.defaultHighlightedImage = [UIImage imageNamed:defaultHighlightedImage];
    self.selectedNormalImage = [UIImage imageNamed:selectedNormalImage];
    self.selectedHighlightedImage = [UIImage imageNamed:selectedHighlightedImage];
    
    if (defaultBlock) {
        self.defaultBlock = defaultBlock;
    }
    if (selectedBlock) {
        self.selectedBlock = selectedBlock;
    }
    
    self.selectedState = NO;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setDefaultButtonTouchupInsideBlock:(defaultButtonTouchupIndeBlock)defaultBlock
          selectedButtonTouchupInsideBlock:(selectedButtonTouchupIndeBlock)selectedBlock{
    if (defaultBlock) {
        self.defaultBlock = defaultBlock;
    }
    if (selectedBlock) {
        self.selectedBlock = selectedBlock;
    }
}

- (void)buttonAction{
    if (self.selectedState) {
        if (self.selectedBlock) {
            self.selectedBlock();
        }
//        [self setImage:self.defaultNormalImage forState:UIControlStateNormal];
//        [self setImage:self.defaultHighlightedImage forState:UIControlStateHighlighted];
        self.selectedState = NO;
    }else{
        if (self.defaultBlock) {
            self.defaultBlock();
        }
        
        self.selectedState = YES;
    }
}

#pragma mark ----------

- (void)setDefaultNormalImage:(NSString *)defaultNormalImage
           defaultHeightImage:(NSString *)defaultHighlightedImage
          selectedNormalImage:(NSString *)selectedNormalImage
        selectedHeightedImage:(NSString *)selectedHighlightedImage
           defaultButtonBlock:(void (^) (BOOL *change))defaultBlock
          selectedButtonBlock:(void (^) (BOOL *change))selectedBlock{

    self.defaultNormalImage = [UIImage imageNamed:defaultNormalImage];
    self.defaultHighlightedImage = [UIImage imageNamed:defaultHighlightedImage];
    self.selectedNormalImage = [UIImage imageNamed:selectedNormalImage];
    self.selectedHighlightedImage = [UIImage imageNamed:selectedHighlightedImage];
    
    if (defaultBlock) {
        self.defaultChangeBlock = defaultBlock;
    }
    if (selectedBlock) {
        self.selectedChangeBlock = selectedBlock;
    }
    
    self.selectedState = NO;
    [self setImage:self.defaultNormalImage forState:UIControlStateNormal];
    [self setImage:self.defaultHighlightedImage forState:UIControlStateHighlighted];
    [self addTarget:self action:@selector(buttonChangeAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonChangeAction{
    if (self.selectedState) {
        __block BOOL chang = YES;
        if (self.selectedChangeBlock) {
            self.selectedChangeBlock(&chang);
        }
        if (chang) {
            [self setImage:self.defaultNormalImage forState:UIControlStateNormal];
            [self setImage:self.defaultHighlightedImage forState:UIControlStateHighlighted];
            self.selectedState = NO;
        }
    }else{
        __block BOOL chang = YES;
        if (self.defaultChangeBlock) {
            self.defaultChangeBlock(&chang);
        }
        if (chang) {
            [self setImage:self.selectedNormalImage forState:UIControlStateNormal];
            [self setImage:self.selectedHighlightedImage forState:UIControlStateHighlighted];
            self.selectedState = YES;
        }
    }
}



@end
