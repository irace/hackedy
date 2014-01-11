//
//  HCKRAppDelegate.m
//  Hackedy
//
//  Created by Bryan Irace on 1/8/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "HCKRAppDelegate.h"
#import "HCKRNewsViewController.h"

@implementation HCKRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    HCKRNewsViewController *newsViewController = [[HCKRNewsViewController alloc] init];
    
    UIViewController *rootViewController;
    
    if ([UIDevice isPhone]) {
        rootViewController = ({
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newsViewController];
            navigationController.navigationBar.barTintColor = [HCKRColors backgroundColor];
            navigationController;
        });
    }
    else {
        rootViewController = ({
            UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
            splitViewController.viewControllers = @[newsViewController];
            splitViewController;
        });
    }
    
    self.window.rootViewController = rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.tintColor = [HCKRColors tintColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
