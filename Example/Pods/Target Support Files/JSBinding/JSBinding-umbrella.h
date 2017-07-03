#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JSBButton.h"
#import "JSBTableView.h"
#import "JSBTextView.h"
#import "JSBViewController.h"
#import "NSIndexPath+JSBinding.h"
#import "NSNotification+JSBinding.h"
#import "NSValue+JSBinding.h"
#import "UIImageView+JSBinding.h"
#import "UILabel+JSBinding.h"
#import "UIView+JSBinding.h"
#import "UIView+Properties.h"

FOUNDATION_EXPORT double JSBindingVersionNumber;
FOUNDATION_EXPORT const unsigned char JSBindingVersionString[];
