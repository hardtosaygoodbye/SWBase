//
//  SWViewModel.m
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWViewModel.h"

@implementation SWViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self sw_initialize];
    }
    return self;
}

- (instancetype)initWithModel:(NSObject *)model{
    self = [self init];
    return self;
}

- (void)sw_initialize{}

@end
