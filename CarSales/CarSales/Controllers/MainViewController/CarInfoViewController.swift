//
//  CarInfoViewController.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/13/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import ImageSlideshow
import UIKit

class CarInfoViewController: ViewController {
  @IBOutlet private(set) var imageSlideShow: ImageSlideshow!
  @IBOutlet private(set) var locationLabel: UILabel!
  @IBOutlet private(set) var priceLabel: UILabel!
  @IBOutlet private(set) var saleStatusLabel: UILabel!
  @IBOutlet private(set) var commentLabel: UILabel!
  @IBOutlet private(set) var commentTitleLabel: UILabel!

  var viewModel: CarInfoViewModelProtocol!
}

// MARK: - Lifecycle

extension CarInfoViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewModel.viewDidDisappear()
  }
}

// MARK: - Setup

private extension CarInfoViewController {
  func setup() {
    setupNavigationBar()
    setupImageSlideShow()
    bind()
  }

  func bind() {
    showHud()
    viewModel.fetchCarDetails(completion: fetchCarInfoHandler())
  }

  func setupNavigationBar() {
    navigationController?.setNavigationBarHidden(false, animated: false)
  }

  func setupImageSlideShow() {
    imageSlideShow.slideshowInterval = 0.0
    imageSlideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
    imageSlideShow.contentScaleMode = UIViewContentMode.scaleToFill

    let pageIndicator = UIPageControl()
    pageIndicator.currentPageIndicatorTintColor = .red
    pageIndicator.pageIndicatorTintColor = .white
    imageSlideShow.pageIndicator = pageIndicator

    imageSlideShow.activityIndicator = DefaultActivityIndicator()
    imageSlideShow.delegate = self

    let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
    imageSlideShow.addGestureRecognizer(recognizer)
  }

  @objc func didTap() {
    let fullScreenController = imageSlideShow.presentFullScreenController(from: self)
    fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(
      style: UIActivityIndicatorView.Style.medium)
  }

  func populateInfo() {
    imageSlideShow.setImageInputs(viewModel.getPhotos())
    locationLabel.text = S.locationTitle(viewModel.location)
    priceLabel.text = S.priceTitle(viewModel.price)
    saleStatusLabel.text = S.saleStatusTitle(viewModel.saleStatus)
    commentTitleLabel.text = S.commentsTitle()
    commentTitleLabel.isHidden = viewModel.comments.isEmpty
    commentLabel.text = viewModel.comments
  }
}

// MARK: - Handlers

private extension CarInfoViewController {
  func fetchCarInfoHandler() -> APIClientResultClosure {
    return { [weak self] status, _ in
      guard let self = self, status else { return }
      self.dismissHud()
      self.populateInfo()
    }
  }
}

// MARK: - ImageSlideshowDelegate

extension CarInfoViewController: ImageSlideshowDelegate {
  func imageSlideshow(
    _ imageSlideshow: ImageSlideshow,
    didChangeCurrentPageTo page: Int
  ) {}
}
