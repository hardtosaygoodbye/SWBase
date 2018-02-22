//
//  SWTableViewCell.m
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import "SWTableViewCell.h"

@implementation SWTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self sw_loadUI];
        [self sw_bindViewModel];
    }
    return self;
}

- (NSString *)reuseId{
    return NSStringFromClass([self class]);
}

- (void)sw_loadUI{}

- (void)sw_bindViewModel{}

@end