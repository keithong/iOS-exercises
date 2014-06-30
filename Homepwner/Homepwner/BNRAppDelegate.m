//
//  BNRAppDelegate.m
//  Homepwner
//
//  Created by Keith Samson on 6/17/14.
//  Copyright (c) 2014 Keith Samson. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRItemsViewController.h"
#import "BNRItemStore.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // If state restoration did not occur
    // set up the view controller hierarchy
    
    if(!self.window.rootViewController)
    {
        // Create a BNRItemsViewController
        BNRItemsViewController *itemsViewController = [[BNRItemsViewController alloc]init];
        
        // Create an instance of UINavigationController
        // its stack contains only itemsViewController
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:itemsViewController];
        
        // Give the navigation controller a restoration identifier that is the
        // same name as the class
        navController.restorationIdentifier = NSStringFromClass([navController class]);
        
        // Place navigation controller's view in the window hierarchy
        self.window.rootViewController = navController;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    BOOL success = [[BNRItemStore sharedStore] saveChanges];
    if(success){
        NSLog(@"Saved all of the BNRItems!");
    } else {
        NSLog(@"Could not save any of the BNRItems");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

-(BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

-(UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    // Create a new navigation controller
    UIViewController *vc = [[UIViewController alloc] init];
    
    // The last object in the path array is the restoration identifier
    // for this view controller
    vc.restorationIdentifier = [identifierComponents lastObject];
    
    if ([identifierComponents count] == 1){
        // If there is only 1 identifier component, then
        // this is the root view controller
        self.window.rootViewController = vc;
    } else {
        // Else, it is the navigation controller for a new item so you need
        // to set its modal presentation style
        vc.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    return vc;
}
@end
