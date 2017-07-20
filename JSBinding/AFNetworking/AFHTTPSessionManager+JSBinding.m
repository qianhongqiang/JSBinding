//
//  AFHTTPSessionManager+JSBinding.m
//  Pods
//
//  Created by qianhongqiang on 2017/7/20.
//
//

#import "AFHTTPSessionManager+JSBinding.h"

@implementation AFHTTPSessionManager (JSBinding)

- (NSURLSessionDataTask *)jsb_GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(JSValue *)success
                      failure:(JSValue *)failure DEPRECATED_ATTRIBUTE {
    return [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [success callWithArguments:@[task,responseObject]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [failure callWithArguments:@[task,error]];
    }];
}

@end
