//
//  NSNotificationCenter+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/11.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol NSNotificationCenterJSBindingProtocol <NSObject,JSExport>

+ (NSNotificationCenter *)defaultCenter;

@end

@interface NSNotificationCenter (JSBinding)<NSNotificationCenterJSBindingProtocol>

@end
