//
//  UIImageView+SDWebImageJSBinding.m
//  Pods
//
//  Created by qianhongqiang on 2017/7/19.
//
//

#import "UIImageView+SDWebImageJSBinding.h"

@implementation UIImageView (SDWebImageJSBinding)

- (void)jsb_setImageWithURL:(nullable NSURL *)url {
    [self sd_setImageWithURL:url];
}

@end
