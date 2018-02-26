//
//  BookListViewController.m
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "BookListViewController.h"
#import "BookTableView.h"
#import "BookListViewModel.h"

@interface BookListViewController ()

@property (nonatomic,weak) BookTableView *tableView;

@end

@implementation BookListViewController

- (void)sw_loadUI{
    BookTableView *tableView = [[BookTableView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)updateViewConstraints{
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

@end
