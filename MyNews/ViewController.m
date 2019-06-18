//
//  ViewController.m
//  MyNews
//
//  Created by P&S on 5/29/19.
//  Copyright © 2019 gosky. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView
@end

@implementation TestView
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    NSLog(@"willmoveToSuperview");
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    NSLog(@"didMoveToSuperview");
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    NSLog(@"willMoveToWindow");
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    NSLog(@"didMoveToWindow");
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}    // Called when the view is about to made visible. Default does nothing
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}   // Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    TestView *redView = [[TestView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [redView addGestureRecognizer:tapGesture];
    
//    UIView *greenView = [[UIView alloc] init];
//    greenView.backgroundColor = [UIColor greenColor];
//    greenView.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:greenView];
}

- (void)pushController {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
