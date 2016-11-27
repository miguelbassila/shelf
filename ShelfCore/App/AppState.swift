//
//  AppState.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct AppState: StateType {
  public let bookShelfState: BookShelfState
}

extension AppState {
  public init() {
    self.bookShelfState = BookShelfState()
  }
}
