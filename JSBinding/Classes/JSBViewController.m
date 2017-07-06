//
//  JSBViewController.m
//  Pods
//
//  Created by qianhongqiang on 2017/6/23.
//
//

#import "JSBViewController.h"
#import "JSBTableView.h"
#import "JSBTextView.h"
#import "JSBButton.h"
#import "JSBUIEdgeInsets.h"
#import "JSBSize.h"

#define arg(index) [JSContext currentArguments][index]
#define intArg(index)  [[JSContext currentArguments][index] toInt32]
#define doubleArg(index) [[JSContext currentArguments][index] toDouble]
#define rectArg(index) [[JSContext currentArguments][index] toRect]
#define objectArg(index)  [[JSContext currentArguments][index] toObject]

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
        _JSContext[@"UITableViewWithRect"] = ^id{
            JSBTableView *tableView = [[JSBTableView alloc] initWithFrame:rectArg(0)];
            tableView.context = weakContext;
            return tableView;
        };
        
        _JSContext[@"ScreenBounds"] = ^id {
            return [JSValue valueWithRect:[[UIScreen mainScreen] bounds] inContext:weakContext];
        };
        
        _JSContext[@"UIView"] = ^id {
            return [[UIView alloc] init];
        };
        
        _JSContext[@"UITableViewCell"] = ^id {
            return [[UITableViewCell alloc] initWithStyle:intArg(0) reuseIdentifier:objectArg(1)];
        };
        
        _JSContext[@"UILabel"] = ^id {
            return [[UILabel alloc] init];
        };
        
        _JSContext[@"UIImageView"] = ^id {
            return [[UIImageView alloc] init];
        };
        
        _JSContext[@"UIImageNamed"] = ^id {
            return [UIImage imageNamed:objectArg(0)];
        };
        
        _JSContext[@"UIButton"] = ^id {
            JSBButton *btn =[[JSBButton alloc] init];
            btn.context = weakContext;
            return btn;
        };
        
        _JSContext[@"UITextView"] = ^id {
            JSBTextView *textView = [[JSBTextView alloc] init];
            textView.context = weakContext;
            return textView;
        };
        
        _JSContext[@"UIColor"] = ^id {
            return [UIColor colorWithRed:doubleArg(0) green:doubleArg(1) blue:doubleArg(2) alpha:doubleArg(3)];
        };
        
        _JSContext[@"UIFont"] = ^id {
            return [UIFont systemFontOfSize:doubleArg(0)];
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
        
        _JSContext[@"UIViewClass"] = NSClassFromString(@"UIView");
        
        __weak typeof(self) weakSelf = self;
        _JSContext[@"self"] = ^id{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            return [JSValue valueWithObject:strongSelf inContext:weakContext];
        };
        
        [_JSContext evaluateScript:script];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof (self) weakSelf = self;
    _JSContext[@"selfView"] = ^id{
        __strong typeof (weakSelf) self = weakSelf;
        return self.view;
    };
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [_JSContext evaluateScript:@"viewDidLoad()"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_JSContext evaluateScript:[NSString stringWithFormat:@"viewDidAppear(%d)",animated]];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
