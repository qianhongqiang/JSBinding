//
//  NSURL+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/19.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol NSURLJSBindingProtocol <NSObject,JSExport>

+ (instancetype)URLWithString:(NSString *)URLString;

@end

@interface NSURL (JSBinding)<NSURLJSBindingProtocol>

@end
