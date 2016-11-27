//
//  BookDetailsReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookDetailReducer: Reducer {
  public typealias ReducerStateType = BookDetailState

  public func handleAction(action: Action, state: BookDetailState?) -> BookDetailState {

    guard let state = state else { return BookDetailState() }
    guard let action = action as? BookDetailAction else { return state }

    switch action {
    case .set(let book):
      return BookDetailState(current: book)
    }
  }
}
