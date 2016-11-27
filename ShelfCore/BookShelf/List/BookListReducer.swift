//
//  ShelfReducer.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookListReducer: Reducer {
  public typealias ReducerStateType = BookListState

  public func handleAction(action: Action, state: BookListState?) -> BookListState {

    guard let state = state else { return BookListState() }
    guard let action = action as? BookListAction else { return state }

    switch action {
    case .add(let book):
      var books = state.books
      books.append(book)
      return BookListState(books: books)
    case .remove(let book):
      var books = state.books
      if let index = books.index(of: book) {
        books.remove(at: index)
        return BookListState(books: books)
      }
      return state
    }
  }
}
