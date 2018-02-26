//
//  BookTableView.m
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "BookTableView.h"
#import <MJRefresh.h>
#import "BookListViewModel.h"

@implementation BookTableView

- (BookListViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[BookListViewModel alloc] init];
    }
    return _viewModel;
}

- (void)sw_loadUI{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.viewModel.refreshDataCommond execute:nil];
    }];
    MJRefreshBackNormalFooter *mjFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.viewModel.nextPageCommond execute:nil];
    }];
    [mjFooter setTitle:@"———— End ————" forState:MJRefreshStateNoMoreData];
    [mjFooter setTitle:@"松手后加载更多" forState:MJRefreshStatePulling];
    [mjFooter setTitle:@"正在玩命加载中..." forState:MJRefreshStateRefreshing];
    [mjFooter setTitle:@"往上拉" forState:MJRefreshStateIdle];
    self.mj_footer = mjFooter;
    self.dataSource = self;
    self.delegate = self;
}

- (void)sw_bindViewModel{
    [self.viewModel.refreshUISubject subscribeNext:^(id  _Nullable x) {
        [self.mj_header endRefreshing];
        [self.mj_footer resetNoMoreData];
        [self reloadData];
    }];
    [self.viewModel.refreshEndSubject subscribeNext:^(id  _Nullable x) {
        [self.mj_footer endRefreshingWithNoMoreData];
        [self reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"123"];
    }
    NSLog(@"data:%@",self.viewModel.dataArray[indexPath.row]);
    cell.textLabel.text = self.viewModel.dataArray[indexPath.row][@"bookName"];
    return cell;
}

@end
