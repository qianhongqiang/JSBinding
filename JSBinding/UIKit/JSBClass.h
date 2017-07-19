//
//  JSBClass.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/11.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol JSBClassJSBindingProtocol <NSObject,JSExport>

-(id)create;

@end

@interface JSBClass : NSObject<JSBClassJSBindingProtocol>

@property (nonatomic, strong) Class innerClass;

@end
