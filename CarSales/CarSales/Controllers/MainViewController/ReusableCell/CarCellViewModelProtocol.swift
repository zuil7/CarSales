//
//  CarCellViewModelProtocol.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

protocol CarCellViewModelProtocol {
  var title: String? { get }
  var price: String? { get }
  var location: String? { get }
  var imageUrl: String? { get }
}
