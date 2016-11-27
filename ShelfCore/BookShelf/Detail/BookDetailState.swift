//
//  BookDetailsState.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public struct BookDetailState: StateType {
  public let current: Book
}

extension BookDetailState {
  public init() {
    current = Book(name: "Xablau", author: "Xableu")
  }
}
