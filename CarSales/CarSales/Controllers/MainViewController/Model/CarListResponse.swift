//
//  CarListResponse.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

// MARK: - AppointmentResponse

struct CarListResponse: Codable {
  let cars: [Car]

  enum CodingKeys: String, CodingKey {
    case cars = "Result"
  }
}

// MARK: - Result

struct Car: Codable {
  let id, title: String
  let location: String?
  let price: String?
  let mainPhoto: String
  let detailsURL: String

  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case title = "Title"
    case location = "Location"
    case price = "Price"
    case mainPhoto = "MainPhoto"
    case detailsURL = "DetailsUrl"
  }
}
