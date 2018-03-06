//
//  NetworkMacro.h
//  SWBase
//
//  Created by willow on 2018/3/6.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#ifndef NetworkMacro_h
#define NetworkMacro_h

#pragma mark - 网络请求头
#ifdef DEBUG
#   define kUrlHeader @"http://127.0.0.1:8000/yidu/api/v1/"
#else
#   define kUrlHeader @"http://www.baidu.com/"

#pragma mark - 首次启动判断
#define kFirstLaunched @"sw_first_launch"

#endif /* NetworkMacro_h */
