//
//  SystemMacro.h
//  SWBase
//
//  Created by willow on 2018/3/6.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#ifndef SystemMacro_h
#define SystemMacro_h

#pragma mark - iOS版本
#define kiosVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark - 当前系统版本
#define kCurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

#pragma mark - 当前系统语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#endif /* SystemMacro_h */
