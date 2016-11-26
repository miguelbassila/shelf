//
//  ApplicationState.swift
//  Shelf
//
//  Created by Miguel Bassila on 26/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct AppState: StateType {
  public let counter: Int
}

extension AppState {
  init() {
    counter = 0
  }
}
