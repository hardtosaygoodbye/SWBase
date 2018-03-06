//
//  StorageMacro.h
//  SWBase
//
//  Created by willow on 2018/3/6.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#ifndef StorageMacro_h
#define StorageMacro_h

#pragma mark - 键值存储
#define kObjectForKey(KEY) [[NSUserDefaults standardUserDefaults]objectForKey:KEY]
#define kSetObjectWithKey(VALUE,KEY) [[NSUserDefaults standardUserDefaults] setObject:VALUE forKey:KEY]
#define kUserDefault [NSUserDefaults standardUserDefaults]

#pragma mark - 令牌名称
#define kTokenName @"sw_token"

#pragma mark - 个人信息
#define kIsLogin (((NSString *)kObjectForKey(kTokenName)).length > 0)

#endif /* StorageMacro_h */
