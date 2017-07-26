//
//  NSIndexPath+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol NSIndexPathJSBindingProtocol <NSObject,JSExport>

- (NSInteger)row;
- (NSInteger)section;

@property (readonly) NSUInteger length;

+ (instancetype)indexPathForRow:(NSInteger)row inSection:(NSInteger)section;

@end

@interface NSIndexPath (JSBinding)<NSIndexPathJSBindingProtocol>

@end
