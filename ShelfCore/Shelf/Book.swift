//
//  Book.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation

struct Book {
  let name: String
  let author: String
}

extension Book: Equatable {
  static func == (lhs: Book, rhs: Book) -> Bool {
    return lhs.name == rhs.name && lhs.author == rhs.author
  }
}
