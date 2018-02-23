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
    self.validStartSignal = [[RACSignal combineLatest:@[RACObserve(self, phone),RACObserve(self, code)] reduce:^id _Nullable{
        @strongify(self);
        return @(self.phone.length > 0 && self.code.length >0);
    }] distinctUntilChanged];
    self.startCommand = [[RACCommand alloc] initWithEnabled:self.validStartSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [SWNetworkManager requestDataWithUrl:urlCheckVerify method:POST param:@{@"phone":self.phone,@"code":self.code} hud:YES];
    }];
}

@end
