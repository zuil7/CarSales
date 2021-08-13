//
//  MainViewControllerIpad.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class MainViewControllerIpad: ViewController {
//  @IBOutlet private(set) var tableView: UITableView!
  @IBOutlet var collectionView: UICollectionView!

  var viewModel: CarViewModelProtocol!
  var collectionDivider: CGFloat = 2
  private var orientationNotification: NSObjectProtocol?
}

// MARK: - Lifecycle

extension MainViewControllerIpad {
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    setupNavigationBar()
  }
}

// MARK: - Setup

private extension MainViewControllerIpad {
  func setup() {
    setOrientationObserver()
    bind()
  }

  func bind() {
    showHud()
    viewModel.fetchCarList(completion: fetchCarHandler())
  }

  func setupNavigationBar() {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }

  func setOrientationObserver() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(orientationChanged(notification:)),
      name: UIDevice.orientationDidChangeNotification,
      object: nil
    )
  }

  @objc
  func orientationChanged(notification: NSNotification) {
    if UIDevice.current.orientation.isLandscape {
      collectionDivider = 3
    } else {
      collectionDivider = 2
    }
    collectionView.reloadData()
  }
}

// MARK: - Handlers

private extension MainViewControllerIpad {
  func fetchCarHandler() -> APIClientResultClosure {
    return { [weak self] status, _ in
      guard let self = self, status else { return }
      self.dismissHud()
      self.collectionView.reloadData()
    }
  }
}
