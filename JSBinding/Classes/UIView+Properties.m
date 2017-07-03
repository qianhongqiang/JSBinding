//
//  UIView+Properties.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "UIView+Properties.h"
#import <objc/runtime.h>

static const void *IndieBandNameKey = &IndieBandNameKey;

@implementation UIView (Properties)

- (void)setProperty:(id)property forKey:(NSString *)key {
    [self.properties setValue:property forKey:key];
}

- (id)getPropertyForKey:(NSString *)key {
    return [self.properties valueForKey:key];
}

- (void)setProperties:(NSMutableDictionary *)properties {
    objc_setAssociatedObject(self, IndieBandNameKey, properties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)properties {
    NSMutableArray *properties = objc_getAssociatedObject(self, IndieBandNameKey);
    if (!properties) {
        [self setProperties:[NSMutableDictionary dictionary]];
    }
    return objc_getAssociatedObject(self, IndieBandNameKey);
}

@end
