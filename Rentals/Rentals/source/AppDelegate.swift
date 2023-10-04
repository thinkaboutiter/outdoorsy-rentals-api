//
//  AppDelegate.swift
//  Rentals
//
//  Created by Boyan Yankov on 4.10.23.
//

import UIKit
import SimpleLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var rootViewControllerFactory: RootViewControllerFactory = {
        let factory = RootViewControllerFactoryImpl()
        return factory
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureSimpleLogger()
        let vc: RootViewController = rootViewControllerFactory.makeRootViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

// MARK: - Configurations
private extension AppDelegate {

    func configureSimpleLogger() {
    #if DEBUG
        SimpleLogger.setVerbosityLevel(SimpleLogger.Verbosity.all.rawValue)
    #else
        SimpleLogger.setVerbosityLevel(SimpleLogger.Verbosity.none.rawValue)
    #endif
    }
}

