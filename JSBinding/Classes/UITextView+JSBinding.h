//
//  UITextView+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/7/12.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UITextViewJSBindingProtocol <NSObject,JSExport>

@property(nonatomic,strong) UIFont *font;
@property(nonatomic,strong) UIColor *textColor;

- (void)setText:(NSString *)text;
- (NSString *)text;

- (void)setDelegate:(id<UITextViewDelegate>)delegate;

@end

@interface UITextView (JSBinding)<UITextViewJSBindingProtocol>

@end
