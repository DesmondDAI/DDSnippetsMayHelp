//
//  DDExtensions.swift
//
//  Created by DAIXinming on 2018/11/21.
//  Copyright © 2018 Xinming DAI. All rights reserved.
//

import UIKit

extension AppDelegate {

    var topViewController: UIViewController {
        return self.topViewController(of: self.window!.rootViewController!)
    }
    
    func topViewController(of rootViewController: UIViewController) -> UIViewController {
        if rootViewController.isKind(of: UITabBarController.self) {
            let tabBarController = rootViewController as! UITabBarController
            return self.topViewController(of: tabBarController.selectedViewController!)
        }
        
        if rootViewController.isKind(of: UINavigationController.self) {
            let navigationController = rootViewController as! UINavigationController
            return self.topViewController(of: navigationController.topViewController!)
        }
        
        guard let presentedViewController = rootViewController.presentedViewController else {
            return rootViewController
        }
        
        return self.topViewController(of: presentedViewController)
    }

}
