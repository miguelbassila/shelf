//
//  ShelfAction.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift

public enum BookListAction: Action {
  case add(Book)
  case remove(Book)
}
