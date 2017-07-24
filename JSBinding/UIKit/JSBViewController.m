//
//  JSBViewController.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "JSBViewController.h"
#import "JSBButton.h"
#import "JSBUIEdgeInsets.h"
#import "JSBSize.h"
#import "JSBClass.h"

#define arg(index) [JSContext currentArguments][index]
#define intArg(index)  [[JSContext currentArguments][index] toInt32]
#define doubleArg(index) [[JSContext currentArguments][index] toDouble]
#define rectArg(index) [[JSContext currentArguments][index] toRect]
#define objectArg(index)  [[JSContext currentArguments][index] toObject]

#define CLASSBINDING(className) _JSContext[className] = NSClassFromString(className);

#define SAFECLASSBINDING(className)         Class class = NSClassFromString(className);\
if (class != NULL) {\
    _JSContext[className] = class;\
}

@implementation JSBViewController
{
    JSContext *_JSContext;
}

- (instancetype)initWithJavascript:(NSString *)script {
    self = [super init];
    if (self) {
        _JSContext = [[JSContext alloc] init];
        
        _JSContext[@"log"] = ^(JSValue *v){
            NSLog(@"JSlog:%@",[v toObject]);
        };
        
        __weak typeof (_JSContext) weakContext = _JSContext;
        
        _JSContext[@"ScreenBounds"] = ^id {
            return [JSValue valueWithRect:[[UIScreen mainScreen] bounds] inContext:weakContext];
        };
        
        _JSContext[@"UITableViewCell"] = ^id {
            return [[UITableViewCell alloc] initWithStyle:intArg(0) reuseIdentifier:objectArg(1)];
        };
        
        _JSContext[@"UIButton"] = ^id {
            JSBButton *btn =[[JSBButton alloc] init];
            btn.context = weakContext;
            return btn;
        };
        
        _JSContext[@"CGRect"] = ^id {
            return [JSValue valueWithRect:CGRectMake(doubleArg(0), doubleArg(1), doubleArg(2), doubleArg(3)) inContext:weakContext];
        };
        
        _JSContext[@"CGSize"] = ^id {
            JSBSize *size = [[JSBSize alloc] init];
            size.size = CGSizeMake(doubleArg(0), doubleArg(1));
            return size;
        };
        
        _JSContext[@"CGSize"] = ^id {
            return [JSValue valueWithSize:CGSizeMake(doubleArg(0), doubleArg(1)) inContext:weakContext];
        };
        
        _JSContext[@"NSIndexPath"] = ^id {
            return [NSIndexPath indexPathForRow:intArg(0) inSection:intArg(1)];
        };
        
        _JSContext[@"UIEdgeInsets"] = ^id{
            JSBUIEdgeInsets *edge = [[JSBUIEdgeInsets alloc] init];
            edge.edge = UIEdgeInsetsMake(doubleArg(0), doubleArg(1), doubleArg(2), doubleArg(3));
            return edge;
        };
        
        _JSContext[@"sizeWithFontMaxSize"] = ^id{
            NSDictionary *attrs = @{NSFontAttributeName : objectArg(1)};
            NSString *s = [NSString stringWithFormat:@"%@",objectArg(0)];
            JSValue *value = [JSContext currentArguments][2];
            CGSize sizeFit = [s boundingRectWithSize:[value toSize] options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
            
            return [JSValue valueWithSize:sizeFit inContext:weakContext];
        };
        
        _JSContext[@"addObserverForName"] = ^{
            NSArray *args = [JSContext currentArguments];
            [[NSNotificationCenter defaultCenter] addObserverForName:objectArg(0) object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
                JSValue * a= [args objectAtIndex:1];
                [a callWithArguments:@[note]];
            }];
        };
        
        _JSContext[@"postNotification"] = ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:objectArg(0) object:nil];
        };
        
        _JSContext[@"Class"] = ^id{
            JSBClass *class = [[JSBClass alloc] init];
            class.innerClass = NSClassFromString(objectArg(0));
            return class;
        };
        
        CLASSBINDING(@"NSUserDefaults")
        CLASSBINDING(@"UIView")
        CLASSBINDING(@"UIColor")
        CLASSBINDING(@"UIFont")
        CLASSBINDING(@"UIImage")
        CLASSBINDING(@"UITableView")
        CLASSBINDING(@"UITextView")
        CLASSBINDING(@"NSURL")
        CLASSBINDING(@"NSURLRequest")
        
        SAFECLASSBINDING(@"AFHTTPSessionManager")
        
        __weak typeof(self) weakSelf = self;
        _JSContext[@"self"] = ^id{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            return [JSValue valueWithObject:strongSelf inContext:weakContext];
        };
        
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"JSBinding" ofType:@"js"];
        NSAssert(path, @"can't find JSPatch.js");
        NSString *jsCore = [[NSString alloc] initWithData:[[NSFileManager defaultManager] contentsAtPath:path] encoding:NSUTF8StringEncoding];
        
        if ([_JSContext respondsToSelector:@selector(evaluateScript:withSourceURL:)]) {
            [_JSContext evaluateScript:jsCore withSourceURL:[NSURL URLWithString:@"JSBinding.js"]];   // withSourceURL指定的JSBinding.js是指jsCore在js调试器下的文件名
        } else {
            [_JSContext evaluateScript:jsCore];
        }

        
        [_JSContext evaluateScript:script];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [_JSContext evaluateScript:@"viewDidLoad()"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_JSContext evaluateScript:[NSString stringWithFormat:@"viewDidAppear(%d)",animated]];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *superSign = [super methodSignatureForSelector:aSelector];
//    if (superSign) {
//        return superSign;
//    }
//    return [NSMethodSignature signatureWithObjCTypes:"@@:@"];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSString *selStr = NSStringFromSelector(anInvocation.selector);
//    selStr = [selStr stringByReplacingOccurrencesOfString:@":" withString:@"_"];
//    selStr = [selStr substringWithRange:NSMakeRange(0, selStr.length - 1)];
//    JSValue *value = _JSContext[selStr];
//    if (![value isUndefined]) {
//        NSMutableArray *args = [NSMutableArray array];
//        NSUInteger argsNumber = anInvocation.methodSignature.numberOfArguments;
//        if (argsNumber <= 1) {
//            JSValue *ret =[value callWithArguments:args];
//            [anInvocation setReturnValue:(void *)ret];
//            return;
//        }
//        
//        for (int i = 2; i < argsNumber; i++) {
//            const char *type = [anInvocation.methodSignature getArgumentTypeAtIndex:i];
//            if (strcmp(type, "@") == 0) {
//                NSObject *obj = nil;
//                [anInvocation getArgument:&obj atIndex:i];
//                if (obj == nil) {
//                    break;
//                }
//                [args addObject:obj];
//            }
//        }
//        
//        JSValue *ret =[value callWithArguments:args];
//        [anInvocation setReturnValue:(void *)ret];
//    }
//}
//
//- (BOOL)respondsToSelector:(SEL)aSelector {
//    if (_JSContext) {
//        NSString *sel = NSStringFromSelector(aSelector);
//        NSString *tranSel = [sel stringByReplacingOccurrencesOfString:@":" withString:@"_"];
//        NSString *delSel = [tranSel substringWithRange:NSMakeRange(0, tranSel.length - 1)];
//        
//        JSValue *value = _JSContext[delSel];
//        if ([value isUndefined]) {
//            return [super respondsToSelector:aSelector];
//        } else {
//            return YES;
//        }
//    }
//    BOOL superRet = [super respondsToSelector:aSelector];
//    return superRet;
//}

#pragma mark - UITableView
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_JSContext[@"scrollViewWillBeginDragging"] callWithArguments:@[scrollView]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_JSContext[@"tableView_numberOfRowsInSection"] callWithArguments:@[tableView,@(section)]] toInt32];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[_JSContext[@"tableView_cellForRowAtIndexPath"] callWithArguments:@[tableView,indexPath]] toObject];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[_JSContext[@"tableView_heightForRowAtIndexPath"] callWithArguments:@[tableView,indexPath]] toDouble];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    JSValue *value = _JSContext[@"textViewShouldBeginEditing"];
    if ([value isUndefined]) {
        return true;
    }
    return [[value callWithArguments:@[textView]] toBool];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    JSValue *value = _JSContext[@"textViewShouldEndEditing"];
    if ([value isUndefined]) {
        return true;
    }
    return [[_JSContext[@"textViewShouldEndEditing"] callWithArguments:@[textView]] toBool];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [_JSContext[@"textViewDidBeginEditing"] callWithArguments:@[textView]];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [_JSContext[@"textViewDidEndEditing"] callWithArguments:@[textView]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    JSValue *value = _JSContext[@"textView_shouldChangeTextInRange_replacementText"];
    if ([value isUndefined]) {
        return true;
    }
    return [[_JSContext[@"textView_shouldChangeTextInRange_replacementText"] callWithArguments:@[textView,[JSValue valueWithRange:range inContext:_JSContext],text]] toBool];
}

- (void)textViewDidChange:(UITextView *)textView {
    [_JSContext[@"textViewDidChange"] callWithArguments:@[textView]];
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    [_JSContext[@"textViewDidChangeSelection"] callWithArguments:@[textView]];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    JSValue *value = _JSContext[@"textView_shouldInteractWithURL_inRange_interaction"];
    if ([value isUndefined]) {
        return true;
    }
    return [[_JSContext[@"textView_shouldInteractWithURL_inRange_interaction"] callWithArguments:@[textView,URL,[JSValue valueWithRange:characterRange inContext:_JSContext],@(interaction)]] toBool];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    JSValue *value = _JSContext[@"textView_shouldInteractWithURL_inRange_interaction"];
    if ([value isUndefined]) {
        return true;
    }
    return [[_JSContext[@"textView_shouldInteractWithURL_inRange_interaction"] callWithArguments:@[textView,textAttachment,[JSValue valueWithRange:characterRange inContext:_JSContext],@(interaction)]] toBool];
}

@end
