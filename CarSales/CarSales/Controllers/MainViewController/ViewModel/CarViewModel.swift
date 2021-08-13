//
//  CarViewModel.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

class CarViewModel: CarViewModelProtocol {
  private var service: CarServiceProtocol
  private var carList: [Car] = []

  var selectedCarHandler: SingleResult<Car>?

  init(service: CarServiceProtocol) {
    self.service = service
  }
}

extension CarViewModel {
  var totalRows: Int { carList.count }

  func carItem(at index: Int) -> CarCellViewModel {
    return CarCellViewModel(car: carList[index])
  }

  func didSelectCar(at index: Int) {
    selectedCarHandler?(carList[index])
  }

  func fetchCarList(completion: @escaping APIClientResultClosure) {
    service.getCarList { [weak self] result, status, message in
      guard let self = self, status else { return completion(false, message) }
      self.carList = result?.cars ?? []
      completion(true, nil)
    }
  }
}
