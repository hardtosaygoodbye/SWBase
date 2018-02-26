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
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"sw_token"];
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
                [SWNetworkManager showErrorHUD:error];
                [subscriber sendError:error];
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
                [SWNetworkManager showErrorHUD:error];
                [subscriber sendError:error];
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
                [SWNetworkManager showErrorHUD:error];
                [subscriber sendError:error];
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
                [SWNetworkManager showErrorHUD:error];
                [subscriber sendError:error];
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
                [SWNetworkManager showErrorHUD:error];
                [subscriber sendError:error];
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }
    return [RACSignal empty];
}

+ (void)showErrorHUD:(NSError *)error{
    [SWNetworkManager hideLoadingHUD];
    NSString *errorMsg;
    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        errorMsg = @"网络异常，请检查网络连接";
    }else if ([error.domain isEqualToString:AFURLResponseSerializationErrorDomain]){
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        errorMsg = [json objectForKey:@"msg"];
    }else{
        errorMsg = @"未知错误";
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.label.text = errorMsg;
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:1.5];
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
