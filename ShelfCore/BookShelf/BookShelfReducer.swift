//
//  ShelfReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookShelfReducer: Reducer {
  public typealias ReducerStateType = BookShelfState

  public func handleAction(action: Action, state: BookShelfState?) -> BookShelfState {

    guard let state = state else { return BookShelfState() }
    guard let action = action as? BookShelfAction else { return state }

    switch action {
    case .add(let book):
      var books = state.books
      books.append(book)
      return BookShelfState(books: books)
    case .remove(let book):
      var books = state.books
      if let index = books.index(of: book) {
        books.remove(at: index)
        return BookShelfState(books: books)
      }
      return state
    }
  }
}
