//
//  SWUI.h
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "SWButton.h"
#import "SWTextField.h"

@interface SWUI : NSObject

+ (UIButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color sytle:(SWButtonStyle)style fView:(UIView *)fview;

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder fontsize:(CGFloat)size fView:(UIView *)fView;

+ (UILabel *)labelWithText:(NSString *)text fontsize:(CGFloat)size color:(UIColor *)color fView:(UIView *)fView;

@end
