//
//  UIImageView+SDWebImageJSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/19.
//
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UIImageViewSDWebImageJSBindingProtocol <NSObject,JSExport>

- (void)jsb_setImageWithURL:(nullable NSURL *)url;

@end

@interface UIImageView (SDWebImageJSBinding)<UIImageViewSDWebImageJSBindingProtocol>

- (void)jsb_setImageWithURL:(nullable NSURL *)url;

@end
