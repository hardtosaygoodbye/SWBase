//
//  SWTextField.h
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWView.h"

@interface SWTextField : SWView

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextField *textField;

+ (instancetype)textFieldWithTitle:(NSString *)title fView:(UIView *)fView;

@end
