//
//  MainViewControllerCoordinator.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

final class MainViewControllerCoordinator: Coordinator {
  private(set) var childCoordinators: [Coordinator] = []

  private let nav: UINavigationController

  init(navigationController: UINavigationController) {
    nav = navigationController
  }

  func start() {
    if UIDevice.current.userInterfaceIdiom == .pad {
      let vc = R.storyboard.mainIpad.mainViewControllerIpad()!
      vc.viewModel = CarViewModel(service: CarService())
      vc.viewModel.selectedCarHandler = carSelectedHandler()
      nav.setViewControllers([vc], animated: false)
    } else {
      let vc = R.storyboard.main.mainViewController()!
      vc.viewModel = CarViewModel(service: CarService())
      vc.viewModel.selectedCarHandler = carSelectedHandler()
      nav.setViewControllers([vc], animated: false)
    }
  }

  func startCarDetailsEvent(carInfo: Car) {
    let carDetailsCoordinator = CarDetailsCoordinator(
      navigationController: nav,
      car: carInfo
    )
    carDetailsCoordinator.didFinishHandler = childDidFinish()
    childCoordinators.append(carDetailsCoordinator)
    carDetailsCoordinator.start()
  }

  func childDidFinish() -> SingleResult<Coordinator>? {
    return { [weak self] childCoordinator in
      guard let self = self else { return }
      if let index = self.childCoordinators.firstIndex(where: { coordinator -> Bool in
        childCoordinator === coordinator
      }) {
        self.childCoordinators.remove(at: index)
      }
    }
  }
}

// MARK: - Handlers

extension MainViewControllerCoordinator {
  func carSelectedHandler() -> SingleResult<Car>? {
    return { [weak self] car in
      guard let self = self else { return }
      self.startCarDetailsEvent(carInfo: car)
    }
  }
}
