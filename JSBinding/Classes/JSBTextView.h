//
//  JSBTextView.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBTextViewJSBindingProtocol <NSObject,JSExport>

@end

@interface JSBTextView : UITextView<JSBTextViewJSBindingProtocol,UITextViewDelegate>

@property (nonatomic, weak) JSContext *context;

@end
