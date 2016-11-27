//
//  AppDelegate.swift
//  Shelf
//
//  Created by Miguel Bassila on 26/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import UIKit
import ReSwift
import ShelfCore

let mainStore = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UINavigationController(rootViewController: BookShelfViewController())
    window?.backgroundColor = UIColor.white
    window?.makeKeyAndVisible()
    return true
  }
}

