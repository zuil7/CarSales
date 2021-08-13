//
//  MainViewController.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
  @IBOutlet private(set) var tableView: UITableView!

  var viewModel: CarViewModelProtocol!
}

// MARK: - Lifecycle

extension MainViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigationBar()
  }
}

// MARK: - Setup

private extension MainViewController {
  func setup() {
    bind()
  }

  func bind() {
    showHud()
    viewModel.fetchCarList(completion: fetchCarHandler())
  }

  func setupNavigationBar() {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
}

// MARK: - Handlers

private extension MainViewController {
  func fetchCarHandler() -> APIClientResultClosure {
    return { [weak self] status, _ in
      guard let self = self, status else { return }
      self.dismissHud()
      self.tableView.reloadData()
    }
  }
}
