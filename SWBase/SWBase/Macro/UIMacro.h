//
//  UIMacro.h
//  SWBase
//
//  Created by willow on 2018/3/6.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

#pragma mark - 屏幕尺寸
#define kScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)
#define kScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)
#define kStatusBarHeiht 20
#define kNavBarHeight 44
#define kTabBarHeight 49

#pragma mark - 色彩
#define kRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - window
#define kWindow [[UIApplication sharedApplication] keyWindow]

#endif /* UIMacro_h */
