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

class BookListViewController: UIViewController {

  var books: [Book]? {
    didSet {
      typedView.tableView.reloadData()
    }
  }

  var typedView: BookListView {
    return view as! BookListView
  }

  override func loadView() {
    self.view = BookListView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    typedView.tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "\(BookTableViewCell.self)")
    typedView.tableView.dataSource = self
    typedView.tableView.delegate = self

    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBook))
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self) { $0.bookListState }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }

  func addBook() {
    let alertController = UIAlertController(title: "New Book", message: nil, preferredStyle: .alert)

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let saveAction = UIAlertAction(title: "Confirm", style: .default) { action in
      guard
        let nameText = alertController.textFields?.first?.text,
        let authorText = alertController.textFields?.last?.text else {
          return
      }

      mainStore.dispatch(BookListAction.add(Book(name: nameText, author: authorText)))
    }

    alertController.addAction(saveAction)
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

extension BookListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookTableViewCell.self)", for: indexPath)
    cell.textLabel?.text = books?[indexPath.row].name
    return cell
  }
}

extension BookListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let book = books?[indexPath.row] else { return }
    mainStore.dispatch(BookDetailAction.set(book))
    navigationController?.pushViewController(BookDetailsViewController(), animated: true)
  }
}

extension BookListViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = BookListState

  func newState(state: BookListState) {
    self.books = state.books
  }
}
