//
//  SWTableViewModel.h
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWViewModel.h"

@interface SWTableViewModel : SWViewModel

@property (nonatomic,strong) RACSubject *refreshUISubject;

@property (nonatomic,strong) RACSubject *refreshEndSubject;

@property (nonatomic,assign) int page;

@property (nonatomic,strong) NSArray *dataArray;

/**
 子类实现
 */
@property (nonatomic,strong) RACCommand *refreshDataCommond;

@property (nonatomic,strong) RACCommand *nextPageCommond;

@end
