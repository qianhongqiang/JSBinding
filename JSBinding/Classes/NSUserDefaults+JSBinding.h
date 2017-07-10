//
//  NSUserDefaults+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/10.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol NSUserDefaultsJSBindingProtocol <NSObject,JSExport>

+ (NSUserDefaults *)standardUserDefaults;

- (id)objectForKey:(NSString *)defaultName;
- (void)setObject:(id)value forKey:(NSString *)defaultName;

@end

@interface NSUserDefaults (JSBinding)<NSUserDefaultsJSBindingProtocol>

@end
