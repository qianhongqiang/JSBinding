//
//  JSBButton.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/30.
//
//

#import "JSBButton.h"

@implementation JSBButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)onTouchUpInside:(JSBButton *)sender {
    [self.context[@"onTouchUpInside"] callWithArguments:@[sender]];
}

@end
