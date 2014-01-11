//
//  HCKRItemViewController.m
//  Hackedy
//
//  Created by Bryan Irace on 1/9/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRItemViewController.h"

@interface HCKRItemViewController ()

@property (nonatomic) HCKRItem *item;

@end

@implementation HCKRItemViewController

#pragma mark - Initialization

- (instancetype)initWithItem:(HCKRItem *)item {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _item = item;
        
        self.title = item.title;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                               target:self action:@selector(share)];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithItem:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:webView];
    
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:self.item.URL]];
}

#pragma mark - Actions

- (void)share {

}

@end
