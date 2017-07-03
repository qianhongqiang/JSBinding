//
//  JSBTextView.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "JSBTextView.h"

@implementation JSBTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate =self;
    }
    return self;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    JSValue *value = self.context[@"textViewShouldBeginEditing"];
    if ([value isUndefined]) {
        return true;
    }
    return [[value callWithArguments:@[textView]] toBool];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    JSValue *value = self.context[@"textViewShouldEndEditing"];
    if ([value isUndefined]) {
        return true;
    }
    return [[self.context[@"textViewShouldEndEditing"] callWithArguments:@[textView]] toBool];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self.context[@"textViewDidBeginEditing"] callWithArguments:@[textView]];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.context[@"textViewDidEndEditing"] callWithArguments:@[textView]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    JSValue *value = self.context[@"textView_shouldChangeTextInRange_replacementText"];
    if ([value isUndefined]) {
        return true;
    }
    return [[self.context[@"textView_shouldChangeTextInRange_replacementText"] callWithArguments:@[textView,[JSValue valueWithRange:range inContext:self.context],text]] toBool];
}

- (void)textViewDidChange:(UITextView *)textView {
    [self.context[@"textViewDidChange"] callWithArguments:@[textView]];
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    [self.context[@"textViewDidChangeSelection"] callWithArguments:@[textView]];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    JSValue *value = self.context[@"textView_shouldInteractWithURL_inRange_interaction"];
    if ([value isUndefined]) {
        return true;
    }
    return [[self.context[@"textView_shouldInteractWithURL_inRange_interaction"] callWithArguments:@[textView,URL,[JSValue valueWithRange:characterRange inContext:self.context],@(interaction)]] toBool];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    JSValue *value = self.context[@"textView_shouldInteractWithURL_inRange_interaction"];
    if ([value isUndefined]) {
        return true;
    }
    return [[self.context[@"textView_shouldInteractWithURL_inRange_interaction"] callWithArguments:@[textView,textAttachment,[JSValue valueWithRange:characterRange inContext:self.context],@(interaction)]] toBool];
}

@end
