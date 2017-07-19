//
//  JSBSize.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/4.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBSizeJSBindingProtocol <NSObject,JSExport>

- (CGFloat)height;

- (CGFloat)width;

@end

@interface JSBSize : NSObject<JSBSizeJSBindingProtocol>

@property (nonatomic, assign) CGSize size;

@end
