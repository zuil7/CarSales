//
//  CarInfoViewModel.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation
import ImageSlideshow

final class CarInfoViewModel: CarInfoViewModelProtocol {
  private var service: CarServiceProtocol
  private var car: Car
  private var carInfo: CarInfoResponse!

  var coordinator: CarDetailsCoordinator?

  init(service: CarServiceProtocol, carInfo: Car) {
    self.service = service
    car = carInfo
  }
}

extension CarInfoViewModel {
  var location: String { carInfo.overview.location }
  var price: String { carInfo.overview.price?.description ?? "n/a" }
  var saleStatus: String { carInfo.saleStatus }
  var comments: String { carInfo.comments }
    
  func getPhotos() -> [KingfisherSource] {
    var source: [KingfisherSource] = []
    guard !carInfo.overview.photos.isEmpty else { return [] }
    source = carInfo.overview.photos.map { item -> KingfisherSource in
      KingfisherSource(urlString: item)!
    }
    return source
  }

  func fetchCarDetails(completion: @escaping APIClientResultClosure) {
    service.getCarDetails(
      detailUri: car.detailsURL,
      completion: { [weak self] result, status, message in
        guard let self = self, status else { return completion(false, message) }
        if let carInfo = result {
          self.carInfo = carInfo
          completion(true, nil)
        }
      }
    )
  }

  func viewDidDisappear() {
    coordinator?.didFinish()
  }
}
