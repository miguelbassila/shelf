//
//  BookDetailsViewController.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import Foundation
import ReSwift
import ShelfCore

class BookDetailsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self) {$0.bookDetailState}
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
}

extension BookDetailsViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = BookDetailState

  func newState(state: BookDetailState) {
    navigationItem.title = state.current.name
  }
}
