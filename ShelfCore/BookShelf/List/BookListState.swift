//
//  ShelfState.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookListState: StateType {
  public let title = "All Books"
  public let books: [Book]
}

extension BookListState {
  public init() {
    books = [Book]()
  }
}
