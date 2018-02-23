//
//  SWButton.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWButton.h"

@implementation SWButton

+ (UIButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color sytle:(SWButtonStyle)style{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    btn.layer.cornerRadius = 5;
    switch (style) {
        case SWButtonStyleSolid:
            btn.backgroundColor = kFirstColor;
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
    return btn;
}

@end
