//
//  UITableView+JSBinding.m
//  Pods
//
//  Created by qianhongqiang on 2017/7/12.
//
//

#import "UITableView+JSBinding.h"

@implementation UITableView (JSBinding)

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    return [[self alloc] initWithFrame:frame style:style];
}

@end
