//
//  MainViewController+CollectionView.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

extension MainViewControllerIpad: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.totalRows
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: R.reuseIdentifier.carCellPad,
      for: indexPath
    ) else {
      return UICollectionViewCell()
    }

    cell.viewModel = viewModel.carItem(at: indexPath.row)

    return cell
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MainViewControllerIpad: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let defaultSize = (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize

    return CGSize(width: collectionView.frame.width / collectionDivider - 5, height: defaultSize?.height ?? 0.0)
  }
}

extension MainViewControllerIpad: UICollectionViewDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    viewModel.didSelectCar(at: indexPath.row)
  }
}
