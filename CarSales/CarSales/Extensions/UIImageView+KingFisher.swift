//
//  UIImageView+KingFisher.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Kingfisher

extension UIImageView {
  func setImageWithURL(
    _ url: URL?,
    placeholder: UIImage? = nil,
    onSuccess: @escaping SingleResult<UIImage> = DefaultClosure.singleResult(),
    onError: @escaping ErrorResult = DefaultClosure.singleResult()
  ) {
    guard let url = url else {
      image = nil
      return
    }
    kf.setImage(
      with: url,
      placeholder: placeholder,
      options: [.transition(.fade(1)), .loadDiskFileSynchronously]
    ) { result in
      switch result {
      case let .success(value):
        onSuccess(value.image)
      case let .failure(error):
        debugPrint(error.localizedDescription)
      }
    }
  }
}


