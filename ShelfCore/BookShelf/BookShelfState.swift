//
//  ShelfState.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookShelfState: StateType {
  public let books: [Book]
}

extension BookShelfState {
  public init() {
    books = [Book]()
  }
}
