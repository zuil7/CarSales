//
//  CarInfoViewModelProtocol.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import ImageSlideshow

protocol CarInfoViewModelProtocol {
  var location: String { get }
  var price: String { get }
  var saleStatus: String { get }
  var comments: String { get }
  func getPhotos() -> [KingfisherSource]
  func fetchCarDetails(completion: @escaping APIClientResultClosure)
  func viewDidDisappear()
}
