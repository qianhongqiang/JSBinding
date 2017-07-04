//
//  JSBButton.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/30.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol UIButtonJSBindingProtocol <NSObject,JSExport>

- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state;

@end

@interface JSBButton : UIButton<UIButtonJSBindingProtocol>

@property (nonatomic, weak) JSContext *context;

@end
