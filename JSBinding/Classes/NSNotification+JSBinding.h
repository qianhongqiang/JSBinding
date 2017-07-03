//
//  NSNotification+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/2.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol NSNotificationJSBindingProtocol <NSObject,JSExport>

-(NSDictionary *)userInfo;

@end

@interface NSNotification (JSBinding)<NSNotificationJSBindingProtocol>

@end
