//
//  SWThirdService.m
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWThirdService.h"

@implementation SWThirdService

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] initCommonData];
    });
}


+ (void)initCommonData{
    
}

@end
