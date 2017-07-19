//
//  UIView+JSBinding.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "UIView+JSBinding.h"

@implementation UIView (JSBinding)

+(void)jsb_animateWithDuration:(NSTimeInterval)duration animations:(JSValue *)animations {
    [self animateWithDuration:duration animations:^{
        [animations callWithArguments:nil];
    }];
}

@end
