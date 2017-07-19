//
//  UIColor+JSBingding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/11.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UIColorJSBindingProtocol <NSObject,JSExport>

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end

@interface UIColor (JSBingding)<UIColorJSBindingProtocol>

@end
