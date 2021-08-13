//
//  CarCellViewModel.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

class CarCellViewModel: CarCellViewModelProtocol {
  private var car: Car

  init(car: Car) {
    self.car = car
  }
}

// MARK: - Getters

extension CarCellViewModel {
  var title: String? { car.title }
  var price: String? { car.price }
  var location: String? { car.location }
  var imageUrl: String? { car.mainPhoto }
}
