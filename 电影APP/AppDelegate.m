//
//  AppDelegate.m
//  电影APP
//
//  Created by 金颀超 on 15/9/14.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "FirstenterViewController.h"
#import "XLSCollectionViewController.h"
#import "DongHuaViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)dealloc
{
    [_window release];
    _window=nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[[DongHuaViewController alloc]init]];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        // 这里判断是否第一次
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"第一次"
                                                      message:@"欢迎来到影院"
                                                     delegate:self
                                            cancelButtonTitle:@"我知道了"
                                            otherButtonTitles:nil];
        [alert show];
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor=[UIColor whiteColor];
        [_window makeKeyAndVisible];
        //标签栏边白色
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent ];
        self.window.rootViewController=[[UINavigationController alloc]initWithRootViewController:[[FirstenterViewController alloc]init]];

               [alert show];
        
        [self.window.rootViewController release];
    }
    else
    {
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor=[UIColor whiteColor];
        [_window makeKeyAndVisible];
        //标签栏边白色
        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent ];
        //创建标签视图控制器
        MainTabBarController *mainTbc=[[MainTabBarController alloc]init];
        _window.rootViewController=mainTbc;
        [mainTbc release];

    }
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

@end
