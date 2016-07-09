//
//  AppDelegate.m
//  0624Waterfall
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 solar. All rights reserved.
//


#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //tabbarController
    UITabBarController *rootTabBarController = [[UITabBarController alloc]init];
    rootTabBarController.tabBar.tintColor = [UIColor colorWithHexString:@"#2cb654"];
    
    //CourseViewController
    CourseViewController *courseViewController = [[CourseViewController alloc]init];
    UINavigationController *courseNavigation = [[UINavigationController alloc]initWithRootViewController:courseViewController];
    courseNavigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"课程" image:[UIImage imageNamed:@"tab1_22x21_"] selectedImage:[[UIImage imageNamed:@"tab1sel_22x21_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //PaymentViewController
    PaymentViewController *paymentViewController = [[PaymentViewController alloc]init];
    UINavigationController *paymentNavigation = [[UINavigationController alloc]initWithRootViewController:paymentViewController];
    paymentNavigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"会员" image:[UIImage imageNamed:@"buytabnosel_24x24_"] selectedImage:[[UIImage imageNamed:@"buytabsel_24x24_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //GeeksViewController
    GeeksViewController *geeksViewController = [[GeeksViewController alloc]init];
    UINavigationController *geeksNavigation = [[UINavigationController alloc]initWithRootViewController:geeksViewController];
    geeksNavigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"极客圈" image:[UIImage imageNamed:@"geekcirclenoTabbar_24x24_"] selectedImage:[[UIImage imageNamed:@"geekcircleTabbar_24x24_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //DiscoverViewController
    DiscoverViewController *discoverViewController = [[DiscoverViewController alloc]init];
    UINavigationController *discoverNavigation = [[UINavigationController alloc]initWithRootViewController:discoverViewController];
    discoverNavigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"tab3_21x21_"] selectedImage:[[UIImage imageNamed:@"tab3sel_21x21_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //MineViewController
    MineViewController *mineViewController = [[MineViewController alloc]init];
    UINavigationController *mineNavigation = [[UINavigationController alloc]initWithRootViewController:mineViewController];
    mineNavigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tab4_22x21_"] selectedImage:[[UIImage imageNamed:@"tab4sel_22x21_"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //填充
    rootTabBarController.viewControllers = @[courseNavigation,paymentNavigation,geeksNavigation,discoverNavigation,mineNavigation];
    
    self.window.rootViewController = rootTabBarController;
    [self.window makeKeyAndVisible];
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
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
