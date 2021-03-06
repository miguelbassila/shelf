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
    return AppState(bookListState: bookListReducer(state: state?.bookListState, action: action),
                    bookDetailState: bookDetailReducer(state: state?.bookDetailState, action: action))
  }

  func bookListReducer(state: BookListState?, action: Action) -> BookListState {
    return BookListReducer().handleAction(action: action, state: state)
  }

  func bookDetailReducer(state: BookDetailState?, action: Action) -> BookDetailState {
    return BookDetailReducer().handleAction(action: action, state: state)
  }
}
