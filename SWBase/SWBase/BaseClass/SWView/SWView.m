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
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

- (instancetype)initWithViewModel:(SWViewModel *)viewModel{
    self = [self init];
    return self;
}

- (void)sw_loadUI{
    
}

- (void)sw_bindViewModel{}

@end
