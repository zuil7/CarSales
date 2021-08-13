//
//  CarCell.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
  @IBOutlet private(set) var carImageView: UIImageView!
  @IBOutlet private(set) var titleLabel: UILabel!
  @IBOutlet private(set) var priceLabel: UILabel!
  @IBOutlet private(set) var locationLabel: UILabel!

  var viewModel: CarCellViewModelProtocol! {
    didSet {
      configureCell()
    }
  }

  private func configureCell() {
    let imageUrl = URL(string: viewModel.imageUrl ?? "")
    carImageView.setImageWithURL(imageUrl)

    titleLabel.text = viewModel.title
    priceLabel.text = viewModel.price
    locationLabel.text = viewModel.location
  }
}
