//
//  UILabel+JSBinding.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/27.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol UILabelJSBindingProtocol <NSObject,JSExport>

- (void)setText:(NSString *)text;

- (void)setFont:(UIFont *)font;

@property(nonatomic,strong) UIColor *textColor;
@property(nonatomic) NSInteger numberOfLines;


@end

@interface UILabel (JSBinding)<UILabelJSBindingProtocol>

@end
