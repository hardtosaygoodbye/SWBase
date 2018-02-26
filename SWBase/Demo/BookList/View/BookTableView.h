//
//  BookTableView.h
//  SWBase
//
//  Created by willow on 2018/2/26.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWTableView.h"
#import "BookListViewModel.h"

@interface BookTableView : SWTableView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) BookListViewModel *viewModel;

@end
