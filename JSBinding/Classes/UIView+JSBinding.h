//
//  UIView+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UIViewJSBindingProtocol <NSObject,JSExport>

- (void)addSubview:(UIView *)view;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

@property(nonatomic) CGRect frame;

- (BOOL)resignFirstResponder;

- (void)removeFromSuperview;

+ (void)jsb_animateWithDuration:(NSTimeInterval)duration animations:(JSValue *)animation;

@end

@interface UIView (JSBinding)<UIViewJSBindingProtocol>

+ (void)jsb_animateWithDuration:(NSTimeInterval)duration animations:(JSValue *)animation;

@end
