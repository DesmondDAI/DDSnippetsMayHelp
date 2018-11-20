//
//  DDViewControllerUtility.m
//
//  Created by DAIXinming on 2018/11/21.
//  Copyright © 2018 Xinming DAI. All rights reserved.
//

#import "DDControllerUtility.h"

@implementation DDViewControllerUtility

+ (UIViewController *)topViewControllerOfRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerOfRootViewController:tabBarController.selectedViewController];
    }
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerOfRootViewController:navigationController.topViewController];
    }
    
    if (!rootViewController.presentedViewController) {
        return rootViewController;
    }
    
    return [self topViewControllerOfRootViewController:rootViewController.presentedViewController];
}

@end
