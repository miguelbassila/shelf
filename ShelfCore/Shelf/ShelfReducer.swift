//
//  ShelfReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

struct ShelfReducer: Reducer {
  typealias ReducerStateType = ShelfState

  func handleAction(action: Action, state: ShelfState?) -> ShelfState {

    guard let state = state else { return ShelfState() }
    guard let action = action as? ShelfAction else { return state }

    switch action {
    case .add(let book):
      var books = state.books
      books.append(book)
      return ShelfState(books: books)
    case .remove(let book):
      var books = state.books
      if let index = books.index(of: book) {
        books.remove(at: index)
        return ShelfState(books: books)
      }
      return state
    }
  }
}
