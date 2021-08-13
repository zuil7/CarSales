//
//  CarDetailsCoordinator.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

final class CarDetailsCoordinator: Coordinator {
  private(set) var childCoordinators: [Coordinator] = []
  private let nav: UINavigationController
  private let car: Car

  var didFinishHandler: SingleResult<Coordinator>?

//  var parentCoordinator: MainViewControllerCoordinator?

  init(
    navigationController: UINavigationController,
    car: Car
  ) {
    nav = navigationController
    self.car = car
  }

  func start() {
    let vc = R.storyboard.main.carInfoViewController()!
    let carInfoViewModel = CarInfoViewModel(service: CarService(),
                                            carInfo: car)
    carInfoViewModel.coordinator = self
    vc.viewModel = carInfoViewModel
    nav.pushViewController(vc, animated: true)
  }

  func didFinish() {
    guard let finish = didFinishHandler else {
      return
    }
    finish(self)
  }

  deinit {
    debugPrint("Deinit CarDetailsCoordinator")
  }
}
