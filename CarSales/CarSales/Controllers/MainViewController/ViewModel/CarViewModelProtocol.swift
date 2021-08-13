//
//  CarViewModelProtocol.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

protocol CarViewModelProtocol {
  var totalRows: Int { get }

  func carItem(at index: Int) -> CarCellViewModel

  func didSelectCar(at index: Int)
    
  var selectedCarHandler: SingleResult<Car>? { get set }

  func fetchCarList(completion: @escaping APIClientResultClosure)
}
