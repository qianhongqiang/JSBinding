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

- (void)reloadData;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

@end

@interface JSBTableView : UITableView<JSBTableViewJSBindingProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) JSContext *context;

@end
