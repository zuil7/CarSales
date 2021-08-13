//
//  CarService.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

final class CarService: BaseService, CarServiceProtocol {
  func getCarList(completion: @escaping ResultClosure<CarListResponse>) {
    let url = carListEP
    consumeAPI(CarListResponse.self, endPoint: url, verb: .GET) { result, error in
      guard error == nil else {
        return completion(nil, false, error?.localizedDescription)
      }
      completion(result, true, nil)
    }
  }

  func getCarDetails(detailUri: String, completion: @escaping ResultClosure<CarInfoResponse>) {
    let url = BaseURL + "\(detailUri)"
    consumeAPI(CarInfoResponse.self, endPoint: url, verb: .GET) { result, error in
      guard error == nil else {
        return completion(nil, false, error?.localizedDescription)
      }
      completion(result, true, nil)
    }
  }
}
