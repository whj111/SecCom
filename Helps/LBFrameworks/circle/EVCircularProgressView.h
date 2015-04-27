



#import <UIKit/UIKit.h>



@interface EVCircularProgressView : UIControl

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UIColor *progressTintColor;
@property (nonatomic, assign) BOOL isAnimating;


- (void)commonInit;
- (void)setProgressTintColor:(UIColor *)progressTintColor;
- (void)startIndeterminateAnimation;
- (void)stopIndeterminateAnimation;


@end
