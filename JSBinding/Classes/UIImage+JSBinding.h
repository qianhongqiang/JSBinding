//
//  UIImage+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/3.
//
//

#import <UIKit/UIKit.h>
#import "JSBUIEdgeInsets.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UIImageJSBindingProtocol <NSObject,JSExport>

- (UIImage *)resizableImageWithJSBCapInsets:(JSBUIEdgeInsets *)capInsets resizingMode:(UIImageResizingMode)resizingMode;

- (UIImage *)resize;

+ (UIImage *)imageNamed:(NSString *)name;

@end

@interface UIImage (JSBinding)<UIImageJSBindingProtocol>

- (UIImage *)resizableImageWithJSBCapInsets:(JSBUIEdgeInsets *)capInsets resizingMode:(UIImageResizingMode)resizingMode;

- (UIImage *)resize;

@end
