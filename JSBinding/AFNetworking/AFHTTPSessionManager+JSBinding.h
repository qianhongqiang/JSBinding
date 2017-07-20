//
//  AFHTTPSessionManager+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/20.
//
//

#import <AFNetworking/AFNetworking.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol AFHTTPSessionManagerJSBindingProtocol <NSObject,JSExport>

+ (instancetype)manager;

- (NSURLSessionDataTask *)jsb_GET:(NSString *)URLString
                            parameters:(id)parameters
                               success:(JSValue *)success
                               failure:(JSValue *)failure DEPRECATED_ATTRIBUTE;

@end

@interface AFHTTPSessionManager (JSBinding)<AFHTTPSessionManagerJSBindingProtocol>

- (NSURLSessionDataTask *)jsb_GET:(NSString *)URLString
                            parameters:(id)parameters
                               success:(JSValue *)success
                               failure:(JSValue *)failure DEPRECATED_ATTRIBUTE;

@end
