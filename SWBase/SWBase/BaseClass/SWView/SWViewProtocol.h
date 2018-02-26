//
//  SWViewProtocol.h
//  SWBase
//
//  Created by admin on 2018/2/22.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SWViewProtocol <NSObject>

@optional
- (void)sw_loadUI;

- (void)sw_bindViewModel;

@end
