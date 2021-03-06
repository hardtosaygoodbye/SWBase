//
//  VerifyViewController.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "VerifyViewController.h"
#import "VerifyViewModel.h"
#import "BookListViewController.h"
#import <MGJRouter.h>

@interface VerifyViewController ()
@property (nonatomic,weak) UITextField *phoneTextField;
@property (nonatomic,weak) UITextField *codeTextField;
@property (nonatomic,weak) SWButton *startButton;
@property (nonatomic,weak) SWButton *getCodeButton;
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
    self.phoneTextField = [SWUI textFieldWithPlaceholder:@"请输入手机号" fontsize:14 fView:self.view];
    self.codeTextField = [SWUI textFieldWithPlaceholder:@"请输入验证码" fontsize:14 fView:self.view];
    self.startButton = [SWButton buttonWithTitle:@"开始" fontsize:14 color:kFirstColor style:0 fView:self.view];
    self.getCodeButton = [SWButton buttonWithTitle:@"获取验证码" fontsize:14 color:kFirstColor style:0 fView:self.view];
}

- (void)updateViewConstraints{
    [self.phoneTextField updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(10);
        make.height.equalTo(@40);
    }];
    [self.getCodeButton updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@40);
        make.width.equalTo(@120);
    }];
    [self.codeTextField updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.getCodeButton.left).offset(-10);
        make.top.equalTo(self.phoneTextField.bottom).offset(10);
        make.height.equalTo(@40);
    }];
    [self.startButton updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.codeTextField.bottom).offset(10);
        make.height.equalTo(@40);
    }];
    [super updateViewConstraints];
}

- (void)sw_bindViewModel{
    RAC(self.viewModel, phone) = [RACSignal merge:@[RACObserve(self.phoneTextField,text), self.phoneTextField.rac_textSignal]];
    RAC(self.viewModel, code) = [RACSignal merge:@[RACObserve(self.codeTextField,text),self.codeTextField.rac_textSignal]];
    self.startButton.rac_command = self.viewModel.startCommand;
    self.getCodeButton.rac_command = self.viewModel.getCodeCommand;
    [self.viewModel.getCodeTitleSubject subscribeNext:^(id  _Nullable x) {
        [self.getCodeButton setTitle:x forState:UIControlStateNormal];
    }];
    [self.startButton.rac_command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        [[NSUserDefaults standardUserDefaults] setValue:x[@"token"] forKey:@"sw_token"];
        [MGJRouter openURL:@"yidu://BookList"];
    }];
    [self.startButton.rac_command.errors subscribeNext:^(NSError * _Nullable x) {
        NSDictionary *userInfo = x.userInfo;
        NSLog(@"error:%@",userInfo);
    }];
}

@end
