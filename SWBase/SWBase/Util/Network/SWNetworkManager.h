//
//  NetworkManager.h
//  daqinjia
//
//  Created by Willow Ma on 2017/9/8.
//  Copyright © 2017年 Willow Ma. All rights reserved.
//
#import "URL.h"
#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface SWNetworkManager : NSObject

typedef NS_ENUM(NSInteger,requestMethod){
    GET,
    POST,
    PUT,
    PATCH,
    DELETE
};

+ (SWNetworkManager *)manager;

+ (RACSignal *)requestDataWithUrl:(NSString *)url method:(requestMethod)method param:(NSDictionary *)param hud:(BOOL)isShow;

@end
