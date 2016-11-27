//
//  AppReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct AppReducer: Reducer {
  public typealias ReducerStateType = AppState

  public init() {}

  public func handleAction(action: Action, state: AppState?) -> AppState {
    return AppState(bookShelfState: bookShelfReducer(state: state?.bookShelfState, action: action))
  }

  func bookShelfReducer(state: BookShelfState?, action: Action) -> BookShelfState {
    return BookShelfReducer().handleAction(action: action, state: state)
  }
}
