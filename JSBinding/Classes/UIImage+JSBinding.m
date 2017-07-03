//
//  UIImage+JSBinding.m
//  Pods
//
//  Created by qianhongqiang on 2017/7/3.
//
//

#import "UIImage+JSBinding.h"

@implementation UIImage (JSBinding)

- (UIImage *)resizableImageWithJSBCapInsets:(JSBUIEdgeInsets *)capInsets resizingMode:(UIImageResizingMode)resizingMode {
    return [self resizableImageWithCapInsets:capInsets.edge resizingMode:resizingMode];
}

@end
