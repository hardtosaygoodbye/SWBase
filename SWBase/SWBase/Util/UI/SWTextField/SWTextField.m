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

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        [self loadUI];
        self.titleLabel.text = title;
    }
    return self;
}

+ (instancetype)textFieldWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (void)loadUI{
    //修改背景颜色
    self.backgroundColor = [UIColor colorWithRed:233.0/255.0 green:238.0/255.0 blue:239.0/255.0 alpha:1];
    //信息提示
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.width.equalTo(@52);
    }];
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.titleLabel = titleLabel;
    //输入文本框
    UITextField *textField = [[UITextField alloc] init];
    [self addSubview:textField];
    [textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(titleLabel.right).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    textField.font = [UIFont systemFontOfSize:14.0];
    self.textField = textField;
}

@end
