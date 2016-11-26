//
//  CounterReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 26/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct CounterReducer: Reducer {

  public init() {}

  public func handleAction(action: Action, state: AppState?) -> AppState {
    guard let state = state else {
        return AppState()
    }

    if let action = action as? CounterAction {
      switch action {
      case .increase:
        return AppState(counter: state.counter+1)
      case .decrease:
        return AppState(counter: state.counter-1)
      }
    }

    return state
  }
}
