//
//  Book.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation

public struct Book {
  public let name: String
  public let author: String

  public init(name: String, author: String) {
    self.name = name
    self.author = author
  }
}

extension Book: Equatable {
  public static func == (lhs: Book, rhs: Book) -> Bool {
    return lhs.name == rhs.name && lhs.author == rhs.author
  }
}
