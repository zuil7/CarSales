//
//  CarServiceProtocol.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

protocol CarServiceProtocol {
  func getCarList(completion: @escaping ResultClosure<CarListResponse>)
  func getCarDetails(detailUri: String, completion: @escaping ResultClosure<CarInfoResponse>)
}
