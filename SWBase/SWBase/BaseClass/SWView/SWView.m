//
//  SWView.m
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWView.h"
#import "SWViewModel.h"

@implementation SWView

- (instancetype)init {
    if (self = [super init]) {
        [self sw_loadUI];
        [self sw_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(SWViewModel *)viewModel{
    self = [self init];
    return self;
}

- (void)sw_loadUI{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)sw_bindViewModel{}

@end
