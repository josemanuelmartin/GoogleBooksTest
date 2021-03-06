//
//  AppDelegate.swift
//  GoogleBooks
//
//  Created by Jose Manuel Martín González.
//  Copyright © 2018 martingonzalezjosemanuel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        createRootViewController()
        
        return true
    }

    private func createRootViewController() {

        let rootWindow = UIWindow(frame: UIScreen.main.bounds)
        window = rootWindow
        
        let vc = DefaultSearchWireframe.createModule()
        let navigation = UINavigationController(rootViewController: vc)

        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

