//
//  UIView+Properties.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UIViewPropertiesProtocol <NSObject,JSExport>

- (void)setProperty:(id)property forKey:(NSString *)key;
- (NSString *)getPropertyForKey:(NSString *)key;

@end

@interface UIView (Properties)<UIViewPropertiesProtocol>

@property (nonatomic, strong) NSMutableDictionary *properties;

- (void)setProperty:(id)property forKey:(NSString *)key;
- (NSString *)getPropertyForKey:(NSString *)key;

@end
