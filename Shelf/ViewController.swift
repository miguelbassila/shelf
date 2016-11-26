//
//  ViewController.swift
//  Shelf
//
//  Created by Miguel Bassila on 26/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import UIKit
import ReSwift
import ShelfCore

class ViewController: UIViewController {

  @IBOutlet weak var pointsLabel: UILabel!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }

  @IBAction func increaseAction(_ sender: Any) {
    mainStore.dispatch(CounterAction.increase)
  }

  @IBAction func decreaseAction(_ sender: Any) {
    mainStore.dispatch(CounterAction.decrease)
  }
}

extension ViewController: StoreSubscriber {

  typealias StoreSubscriberStateType = AppState

  func newState(state: AppState) {
    pointsLabel.text = "\(state.counter)"
  }
}
