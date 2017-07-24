//
//  UIWebView+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/11.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UIWebViewJSBindingProtocol <NSObject,JSExport>

- (void)loadRequest:(NSURLRequest *)request;

@end

@interface UIWebView (JSBinding)<UIWebViewJSBindingProtocol>

@end
