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

@property(nonatomic,copy) NSString *text;
@property(nonatomic,strong) UIFont *font;
@property(nonatomic,strong) UIColor *textColor;


@end

@interface JSBTextView : UITextView<JSBTextViewJSBindingProtocol,UITextViewDelegate>

@property (nonatomic, weak) JSContext *context;

@end
