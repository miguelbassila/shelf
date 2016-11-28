//
//  BookListView.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import UIKit

class BookListView: UIView {

  let tableView = UITableView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }

  required public init() {
    super.init(frame: CGRect.zero)
    self.setup()
  }

  private func setup() {
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
  }
}
