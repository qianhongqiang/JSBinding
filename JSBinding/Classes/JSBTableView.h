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

- (CGRect)rectForSection:(NSInteger)section;
- (CGRect)rectForHeaderInSection:(NSInteger)section;
- (CGRect)rectForFooterInSection:(NSInteger)section;
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point;
- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell;
- (NSArray<NSIndexPath *> *)indexPathsForRowsInRect:(CGRect)rect;

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, readonly) NSArray *visibleCells;
@property (nonatomic, readonly) NSArray<NSIndexPath *> *indexPathsForVisibleRows;

- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section;
- (UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section;

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
- (void)scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

- (void)beginUpdates;
- (void)endUpdates;

- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

@end

@interface JSBTableView : UITableView<JSBTableViewJSBindingProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) JSContext *context;

@end
