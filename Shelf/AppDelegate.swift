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

let mainStore = Store<AppState>(reducer: CounterReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
}

