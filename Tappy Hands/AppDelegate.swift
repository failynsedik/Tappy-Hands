//
//  AppDelegate.swift
//  Tappy Hands
//
//  Created by Failyn Kaye M. Sedik on 10/30/20.
//

import GoogleMobileAds
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: - App Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set root view controller
        let rootVC = HomeViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        // Initialize the Mobile Ads SDK
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }
    
}
