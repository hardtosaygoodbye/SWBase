//
//  VerifyViewController.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "VerifyViewController.h"
#import "VerifyViewModel.h"

@interface VerifyViewController ()

@property (nonatomic,weak) SWTextField *phoneTextField;
@property (nonatomic,weak) SWTextField *codeTextField;
@property (nonatomic,weak) SWButton *startButton;
@property (nonatomic,strong) VerifyViewModel *viewModel;
@end

@implementation VerifyViewController

- (VerifyViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[VerifyViewModel alloc] init];
    }
    return _viewModel;
}

- (void)sw_loadUI{
    SWTextField *phoneTextField = [SWTextField textFieldWithTitle:@"手机号"];
    [self.view addSubview:phoneTextField];
    [phoneTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(10);
        make.height.equalTo(@40);
    }];
    self.phoneTextField = phoneTextField;
    
    SWTextField *codeTextField = [SWTextField textFieldWithTitle:@"验证码"];
    [self.view addSubview:codeTextField];
    [codeTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(phoneTextField.bottom).offset(10);
        make.height.equalTo(@40);
    }];
    self.codeTextField = codeTextField;
    
    SWButton *startButton = [SWButton buttonWithTitle:@"开始" fontsize:14 color:kFirstColor sytle:SWButtonStyleSolid];
    [self.view addSubview:startButton];
    [startButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(codeTextField.bottom).offset(10);
        make.height.equalTo(@40);
    }];
    self.startButton = startButton;
}

- (void)sw_bindViewModel{
    RAC(self.viewModel, phone) = [RACSignal merge:@[RACObserve(self.phoneTextField.textField,text), self.phoneTextField.textField.rac_textSignal]];
    RAC(self.viewModel, code) = [RACSignal merge:@[RACObserve(self.codeTextField.textField, text),self.codeTextField.textField.rac_textSignal]];
    self.startButton.rac_command = self.viewModel.startCommand;
    [self.startButton.rac_command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"hello:%@",x);
    }];
    [self.startButton.rac_command.errors subscribeNext:^(NSError * _Nullable x) {
        NSDictionary *userInfo = x.userInfo;
        NSLog(@"error:%@",userInfo);
    }];
}

@end
