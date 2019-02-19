//
//  AppDelegate.swift
//  schedule
//
//  Created by Влад Лиховид on 1/13/19.
//  Copyright © 2019 Влад Лиховид. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let service = MoyaProvider<RequestService>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}
