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

- (UIImage *)resize
{

    CGFloat imageW = self.size.width * 0.5;
    CGFloat imageH = self.size.height * 0.8;
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}

@end
