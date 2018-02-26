//
//  SWButton.m
//  SWBase
//
//  Created by willow on 2018/2/25.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWButton.h"

@implementation SWButton

+ (SWButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color style:(SWButtonStyle)style fView:(UIView *)fview{
    SWButton *btn = [SWButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    btn.layer.cornerRadius = 5;
    btn.sw_style = style;
    btn.sw_enableColor = color;
    btn.sw_disableColor = kThirdColor;
    if (style == SWButtonStyleHollow) {
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.borderWidth = 1;
    }
    [fview addSubview:btn];
    return btn;
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    switch (self.sw_style) {
        case SWButtonStyleSolid:
        {
            self.backgroundColor = enabled ? self.sw_enableColor : self.sw_disableColor;
        }
            break;
        case SWButtonStyleHollow:
        {
            self.layer.borderColor = enabled ? self.sw_enableColor.CGColor : self.sw_disableColor.CGColor;
            [self setTitleColor:self.sw_enableColor forState:UIControlStateNormal];
            [self setTitleColor:self.sw_disableColor forState:UIControlStateDisabled];
        }
            break;
        default:
            break;
    }
}

@end
