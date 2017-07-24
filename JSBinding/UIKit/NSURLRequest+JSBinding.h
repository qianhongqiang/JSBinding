//
//  NSURLRequest+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/24.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol NSURLRequestJSBindingProtocol <NSObject,JSExport>

+ (instancetype)requestWithURL:(NSURL *)URL;

@end

@interface NSURLRequest (JSBinding)<NSURLRequestJSBindingProtocol>

@end
