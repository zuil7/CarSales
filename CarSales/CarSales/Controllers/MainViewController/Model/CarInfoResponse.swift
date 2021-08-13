//
//  CarInfoResponse.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

// MARK: - AppointmentResponse

struct CarInfoResponse: Codable {
  let id: String
  let saleStatus: String
  let title: String
  let overview: Overview
  let comments: String

  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case saleStatus = "SaleStatus"
    case title = "Title"
    case overview = "Overview"
    case comments = "Comments"
  }
}

// MARK: - Overview

struct Overview: Codable {
  let location: String
  let price: String?
  let photos: [String]

  enum CodingKeys: String, CodingKey {
    case location = "Location"
    case price = "Price"
    case photos = "Photos"
  }
}
