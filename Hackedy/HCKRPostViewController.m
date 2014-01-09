//
//  HCKRPostViewController.m
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRPostViewController.h"

@interface HCKRPostViewController ()

@property (nonatomic) HCKRPost *post;

@end

@implementation HCKRPostViewController

#pragma mark - Initialization

- (instancetype)initWithPost:(HCKRPost *)post {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _post = post;
        self.title = post.title;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithPost:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:webView];
    
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:self.post.URL]];
}

@end
