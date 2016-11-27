//
//  BookShelfViewController.swift
//  Shelf
//
//  Created by Miguel Bassila on 27/11/16.
//  Copyright © 2016 Miguel Bassila. All rights reserved.
//

import UIKit
import ReSwift
import ShelfCore

class BookShelfViewController: UIViewController {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)

    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBook))
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self) { $0.bookShelfState }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }

  func addBook() {
    let alertController = UIAlertController(title: "New Book", message: nil, preferredStyle: .alert)

    let saveAction = UIAlertAction(title: "Confirm", style: .default) { action in
      guard
        let nameText = alertController.textFields?.first?.text,
        let authorText = alertController.textFields?.last?.text else {
          return
      }

      mainStore.dispatch(BookShelfAction.add(Book(name: nameText, author: authorText)))
    }
    alertController.addAction(saveAction)

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    alertController.addAction(cancelAction)

    alertController.addTextField {
      $0.placeholder = "Name"
    }

    alertController.addTextField {
      $0.placeholder = "Author"
    }

    self.present(alertController, animated: true, completion: nil)
  }
}

extension BookShelfViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainStore.state.bookShelfState.books.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = mainStore.state.bookShelfState.books[indexPath.row].name
    return cell
  }
}

extension BookShelfViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let book = mainStore.state.bookShelfState.books[indexPath.row]
    mainStore.dispatch(BookShelfAction.remove(book))
  }
}

extension BookShelfViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = BookShelfState

  func newState(state: BookShelfState) {
    tableView.reloadData()
  }
}
