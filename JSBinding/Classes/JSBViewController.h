//
//  JSBViewController.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBViewControllerExportToJS <NSObject,JSExport>

@property(nonatomic,strong) UIView *view;

@end

@interface JSBViewController : UIViewController<JSBViewControllerExportToJS>

- (instancetype)initWithJavascript:(NSString *)script;

- (void)testA:(int)a testB:(id)B textC:(BOOL)c;

@end
