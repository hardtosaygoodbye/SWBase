//
//  SWButton.h
//  SWBase
//
//  Created by willow on 2018/2/25.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SWButtonStyle){
    SWButtonStyleSolid,
    SWButtonStyleHollow
};

@interface SWButton : UIButton

@property (nonatomic,strong) UIColor *sw_enableColor;
@property (nonatomic,strong) UIColor *sw_disableColor;
@property (nonatomic,assign) SWButtonStyle sw_style;

+ (SWButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color style:(SWButtonStyle)style fView:(UIView *)fview;

@end
