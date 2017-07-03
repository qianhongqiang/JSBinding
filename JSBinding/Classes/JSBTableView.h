//
//  JSBTableView.h
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSBTableViewJSBindingProtocol <NSObject,JSExport>

- (UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

@end

@interface JSBTableView : UITableView<JSBTableViewJSBindingProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) JSContext *context;

@end
