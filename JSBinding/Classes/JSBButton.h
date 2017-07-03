//
//  JSBButton.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/30.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSBButton : UIButton

@property (nonatomic, weak) JSContext *context;

@end
