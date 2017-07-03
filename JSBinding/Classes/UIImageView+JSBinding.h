//
//  UIImageView+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/1.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UIImageViewJSBindingProtocol <NSObject,JSExport>

- (void)setImage:(UIImage *)image;

@end

@interface UIImageView (JSBinding)<UIImageViewJSBindingProtocol>

@end
