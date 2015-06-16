//
//  AppDelegate.m
//  HackerNews
//
//  Created by Michael McKinney on 6/8/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import "ColorUtil.h"
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "ThemeManager.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSDictionary *styles = [ThemeManager sharedManager].styles; //access the plist file that's selected
    NSString *barColor = [styles objectForKey:@"navBar"];        //set the bar color to plist's navBar code
    NSString *buttonColor = [styles objectForKey:@"navText"];   //set navbar buttons color to the plists navtext

    [[UINavigationBar appearance] setBarTintColor:[ColorUtil colorFromHexString:barColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [ColorUtil colorFromHexString:buttonColor]}];
    [[UINavigationBar appearance] setTintColor:[ColorUtil colorFromHexString:buttonColor]];               //set up the navbar's color
    
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *MnavigationController = [splitViewController.viewControllers objectAtIndex:0];
    UINavigationController *DnavigationController = [splitViewController.viewControllers objectAtIndex:1];          //get ahold of both of hte detail and master view controllers for setting delegates/properties
    
    MasterViewController *master = (MasterViewController *)[MnavigationController topViewController];
    DetailViewController *detail = (DetailViewController *)[DnavigationController topViewController];
    
    //master.delegate = detail;
    Story *first = [[master.viewModel Stories] objectAtIndex:0];      //assign initial story
    [detail setupStoryValue:first];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] story] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}


@end
