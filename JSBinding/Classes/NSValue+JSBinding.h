//
//  NSValue+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/3.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol NSValueJSBindingProtocol <NSObject,JSExport>

-(CGRect)CGRectValue;

@end

@interface NSValue (JSBinding)<NSValueJSBindingProtocol>

@end
