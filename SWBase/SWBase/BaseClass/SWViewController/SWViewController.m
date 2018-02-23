//
//  SWViewController.m
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWViewController.h"
#import <Masonry.h>
#import "SWView.h"

@interface SWViewController ()

@end

@implementation SWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    [self sw_loadNavigationStyle];
    [self sw_loadUI];
    [self sw_bindViewModel];
}

- (void)initialize {
    self.view.backgroundColor = [UIColor lightGrayColor];
    //修改边界
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)sw_loadNavigationStyle{
    //修改导航栏颜色
    self.navigationController.navigationBar.barTintColor = kFirstColor;
    //修改导航栏文字颜色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = kSecondColor;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)sw_loadUI{}

- (void)sw_bindViewModel{}

@end
