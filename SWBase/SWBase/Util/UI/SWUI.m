//
//  SWUI.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWUI.h"

@implementation SWUI

+ (UIButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color sytle:(SWButtonStyle)style fView:(UIView *)fview{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    btn.layer.cornerRadius = 5;
    switch (style) {
        case SWButtonStyleSolid:
        {
            if (btn.enabled) {
                btn.backgroundColor = kFirstColor;
            }else{
                btn.backgroundColor = [UIColor lightGrayColor];
            }
            
        }
            break;
        case SWButtonStyleHollow:
        {
            btn.backgroundColor = [UIColor whiteColor];
            btn.layer.borderColor = kFirstColor.CGColor;
            btn.layer.borderWidth = 1;
            [btn setTitleColor:kFirstColor forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    [fview addSubview:btn];
    return btn;
}

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder fontsize:(CGFloat)size fView:(UIView *)fView{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:size];
    [fView addSubview:textField];
    return textField;
}

+ (UILabel *)labelWithText:(NSString *)text fontsize:(CGFloat)size color:(UIColor *)color fView:(UIView *)fView{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    [fView addSubview:label];
    return label;
}

@end
