//
//  UIFont+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/11.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UIFontJSBindingProtocol <NSObject,JSExport>

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)italicSystemFontOfSize:(CGFloat)fontSize;

@end

@interface UIFont (JSBinding)<UIFontJSBindingProtocol>

@end
