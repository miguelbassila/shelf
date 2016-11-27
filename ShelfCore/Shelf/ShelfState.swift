//
//  ShelfState.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

struct ShelfState: StateType {
  let books: [Book]
}

extension ShelfState {
  init() {
    books = [Book]()
  }
}
