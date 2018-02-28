//
//  BookListViewModel.m
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "BookListViewModel.h"

@implementation BookListViewModel

- (void)sw_initialize{
    self.page = 0;
    self.refreshUISubject = [RACSubject subject];
    self.refreshEndSubject = [RACSubject subject];
    // 下拉刷新
    self.refreshDataCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [SWNetworkManager requestDataWithUrl:urlBook method:GET param:@{@"page":@0,@"keyword":@""} hud:NO];
    }];
    [self.refreshDataCommond.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        self.page = 0;
        self.dataArray = x;
        [self.refreshUISubject sendNext:nil];
    }];
    [self.refreshDataCommond.errors subscribeNext:^(NSError * _Nullable x) {
        [self.refreshUISubject sendNext:nil];
    }];
    // 上拉加载更多
    self.nextPageCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [SWNetworkManager requestDataWithUrl:urlBook method:GET param:@{@"page":@(self.page+1),@"keyword":@""} hud:NO];
    }];
    [self.nextPageCommond.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSArray *jsonArr = x;
        if (jsonArr.count == 0) {
            [self.refreshEndSubject sendNext:nil];
        }else{
            self.page ++;
            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.dataArray];
            [tempArray addObjectsFromArray:jsonArr];
            [self.refreshUISubject sendNext:nil];
        }
    }];
    [self.nextPageCommond.errors subscribeNext:^(NSError * _Nullable x) {
        [self.refreshUISubject sendNext:nil];
    }];
    [self.refreshDataCommond execute:nil];
}

@end
