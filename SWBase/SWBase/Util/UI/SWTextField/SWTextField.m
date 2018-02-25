//
//  SWTextField.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWTextField.h"
#import <Masonry.h>

@implementation SWTextField

- (instancetype)initWithTitle:(NSString *)title fView:(UIView *)fView{
    if (self = [super init]) {
        self.titleLabel.text = title;
        [fView addSubview:self];
    }
    return self;
}

+ (instancetype)textFieldWithTitle:(NSString *)title fView:(UIView *)fView{
    return [[self alloc] initWithTitle:title fView:fView];
}

- (void)sw_loadUI{
    //修改背景颜色
    self.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1];
    //信息提示
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.titleLabel = titleLabel;
    //输入文本框
    UITextField *textField = [[UITextField alloc] init];
    [self addSubview:textField];
    
    textField.font = [UIFont systemFontOfSize:14.0];
    self.textField = textField;
    [super sw_loadUI];
}

- (void)updateConstraints{
    [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@52);
    }];
    [self.textField updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self.titleLabel.right).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [super updateConstraints];
}

@end
