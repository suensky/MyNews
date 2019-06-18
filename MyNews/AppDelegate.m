//
//  AppDelegate.m
//  MyNews
//
//  Created by P&S on 5/29/19.
//  Copyright © 2019 gosky. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // UIViewController *controller1 = [[UIViewController alloc] init];
    // navigationController.view.backgroundColor = [UIColor redColor];
    navigationController.tabBarItem.title = @"News";
    navigationController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor greenColor];
    controller2.tabBarItem.title = @"Video";
    controller2.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    controller2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor blueColor];
    controller3.tabBarItem.title = @"Recommended";
    controller3.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
    controller3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor yellowColor];
    controller4.tabBarItem.title = @"Mine";
    controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    [tabBar setViewControllers:@[navigationController, controller2, controller3, controller4]];
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MyNews"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
