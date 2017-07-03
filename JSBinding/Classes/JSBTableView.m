//
//  JSBTableView.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "JSBTableView.h"

@implementation JSBTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate =self;
        self.dataSource = self;
    }
    return self;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.context[@"scrollViewWillBeginDragging"] callWithArguments:@[scrollView]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.context[@"tableView_numberOfRowsInSection"] callWithArguments:@[tableView,@(section)]] toInt32];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.context[@"tableView_cellForRowAtIndexPath"] callWithArguments:@[tableView,indexPath]] toObject];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.context[@"tableView_heightForRowAtIndexPath"] callWithArguments:@[tableView,indexPath]] toDouble];
}

@end
