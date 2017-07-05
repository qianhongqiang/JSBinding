//
//  UITableViewCell+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/5.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UITableViewCellJSBindingProtocol <NSObject,JSExport>

@end

@interface UITableViewCell (JSBinding)<UITableViewCellJSBindingProtocol>

@end
