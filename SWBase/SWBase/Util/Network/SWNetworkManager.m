//
//  NetworkManager.m
//  daqinjia
//
//  Created by Willow Ma on 2017/9/8.
//  Copyright © 2017年 Willow Ma. All rights reserved.
//

#import "SWNetworkManager.h"
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>
#import <MBProgressHUD.h>

static SWNetworkManager *_manager = nil;
static AFHTTPSessionManager *afnManager = nil;

@implementation SWNetworkManager

+ (SWNetworkManager *)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [[SWNetworkManager alloc] init];
            afnManager = [AFHTTPSessionManager manager];
            AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
            [serializer setRemovesKeysWithNullValues:YES];
            afnManager.responseSerializer = serializer;
            afnManager.requestSerializer = [AFJSONRequestSerializer serializer];
            afnManager.requestSerializer.timeoutInterval = 5.f;
        }
    });
    return _manager;
}

+ (RACSignal *)requestDataWithUrl:(NSString *)url method:(requestMethod)method param:(NSDictionary *)param hud:(BOOL)isShow{
    if (isShow) {
        [SWNetworkManager showLoadingHUD];
    }
    [SWNetworkManager manager];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults objectForKey:@"token"];
    NSMutableDictionary *resultParam = [NSMutableDictionary dictionaryWithDictionary:param];
    if (token) {
        [resultParam setValue:token forKey:@"token"];
    }
    NSString *resultUrl = [NSString stringWithFormat:@"%@%@",urlHeader,url];
    // debug
    NSLog(@"url:%@,param:%@",resultUrl,resultParam);
    if (method == GET) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [afnManager GET:resultUrl parameters:resultParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                [SWNetworkManager hideLoadingHUD];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSError *resultError = [SWNetworkManager errorWithNetworkError:error];
                [subscriber sendError:resultError];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }else if (method == POST) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [afnManager POST:resultUrl parameters:resultParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                [SWNetworkManager hideLoadingHUD];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSError *resultError = [SWNetworkManager errorWithNetworkError:error];
                [subscriber sendError:resultError];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }else if (method == PUT) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [afnManager PUT:resultUrl parameters:resultParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                [SWNetworkManager hideLoadingHUD];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSError *resultError = [SWNetworkManager errorWithNetworkError:error];
                [subscriber sendError:resultError];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }else if (method == PATCH) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [afnManager PATCH:resultUrl parameters:resultParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                [SWNetworkManager hideLoadingHUD];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSError *resultError = [SWNetworkManager errorWithNetworkError:error];
                [subscriber sendError:resultError];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }else if (method == DELETE) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [afnManager DELETE:resultUrl parameters:resultParam success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
                [SWNetworkManager hideLoadingHUD];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSError *resultError = [SWNetworkManager errorWithNetworkError:error];
                [subscriber sendError:resultError];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }
    return [RACSignal empty];
}

+ (NSError *)errorWithNetworkError:(NSError *)error{
    NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSString *errorMsg = [userInfo objectForKey:@"msg"];
    [SWNetworkManager hideLoadingHUD];
    if (errorMsg) {
        [SWNetworkManager showErrorHUD:errorMsg];
    }
    return [NSError errorWithDomain:@"Network" code:error.code userInfo:userInfo];
}

+ (void)showErrorHUD:(NSString *)text{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:1];
}

+ (void)showLoadingHUD{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.label.text = @"正在玩命加载中...";
}

+ (void)hideLoadingHUD{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:window animated:YES];
}

@end
