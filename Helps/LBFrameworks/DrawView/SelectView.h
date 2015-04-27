//
//  SelectView.h
//  animation
//
//  Created by libo on 12/9/14.
//  Copyright (c) 2014 LB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TitleSytle) {
    TitleSytleSubTitle,
    TitleSytleCenter,
};

typedef void(^SelectAtIndex)(NSInteger index);

@interface SelectView : UIView

@property (nonatomic, assign) TitleSytle titleStyle;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, copy) SelectAtIndex selectAtIndex;

@property (nonatomic, strong) UIButton *backButton;


- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)array;

- (void)startAnimation;





@end



/* how to use
 
 SelectView *aview = [[SelectView alloc] initWithFrame:self.view.bounds
 titleArray:@[@"一步之遥", @"aaaa"]];
 [self.view addSubview:aview];
 [aview startAnimation];
 aview.selectAtIndex = ^(NSInteger index){
 NSLog(@"%d",index);
 };
 
 
 */




