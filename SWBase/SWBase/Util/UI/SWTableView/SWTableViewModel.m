//
//  SWTableViewModel.m
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWTableViewModel.h"

@implementation SWTableViewModel

- (void)sw_initialize{
    [super sw_initialize];
    self.page = 0;
    self.refreshUISubject = [RACSubject subject];
    self.refreshEndSubject = [RACSubject subject];
}

@end
