//
//  SWTableView.m
//  SWBase
//
//  Created by willow on 2018/2/27.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWTableView.h"

@implementation SWTableView

- (instancetype)init{
    if (self = [super init]) {
        [self sw_loadUI];
        [self sw_bindViewModel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self sw_loadUI];
        [self sw_bindViewModel];
    }
    return self;
}

- (void)sw_loadUI{}

- (void)sw_bindViewModel{}

@end
