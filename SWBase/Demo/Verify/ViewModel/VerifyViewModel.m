//
//  VerifyViewModel.m
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "VerifyViewModel.h"

@implementation VerifyViewModel

- (void)sw_initialize{
    [super sw_initialize];
    @weakify(self);
    // 开始
    RACSignal *validStartSignal = [[RACSignal combineLatest:@[RACObserve(self, phone),RACObserve(self, code)] reduce:^(NSString *phone,NSString *code){
        return @(phone.length == 11 && code.length == 4);
    }] distinctUntilChanged];
    self.startCommand = [[RACCommand alloc] initWithEnabled:validStartSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [SWNetworkManager requestDataWithUrl:urlCheckVerify method:POST param:@{@"phone":self.phone,@"code":self.code} hud:YES];
    }];
    // 验证码
    self.lastSecond = 0;
    self.getCodeTitleSubject = [RACSubject subject];
    RACSignal *validGetCodeSignal = [RACSignal combineLatest:@[RACObserve(self, phone),RACObserve(self, lastSecond)] reduce:^(NSString *phone,NSNumber *lastSecond){
        return @(phone.length == 11 && lastSecond.intValue <= 0);
    }];
    self.getCodeCommand = [[RACCommand alloc] initWithEnabled:validGetCodeSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        return [SWNetworkManager requestDataWithUrl:urlVerify method:POST param:@{@"phone":self.phone} hud:YES];
    }];
    [self.getCodeCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.lastSecond = @30;
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
    }];
}

- (void)countDown:(NSTimer *)timer {
    [self.getCodeTitleSubject sendNext:[NSString stringWithFormat:@"%d秒后重新获取",self.lastSecond.intValue]];
    self.lastSecond = [NSNumber numberWithInt:self.lastSecond.intValue-1];
    if (self.lastSecond.intValue <= 0) {
        self.lastSecond = [NSNumber numberWithInt:0];
        [timer invalidate];
        [self.getCodeTitleSubject sendNext:@"获取验证码"];
    }
}

@end
