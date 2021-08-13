//
//  UIView+Designable.swift
//  CarSales
//
//  Created by Louise Nicolas Namoc on 8/12/21.
//  Copyright © 2021 Louise Nicolas Namoc. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
extension UIView {
  @IBInspectable public var cornerRadius: Double {
    get {
      return Double(layer.cornerRadius)
    }
    set {
      layer.cornerRadius = CGFloat(newValue)
    }
  }

  @IBInspectable public var borderWidth: Double {
    get {
      return Double(layer.borderWidth)
    }
    set {
      layer.borderWidth = CGFloat(newValue)
    }
  }

  @IBInspectable public var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }

  @IBInspectable public var shadowColor: UIColor? {
    get {
      return UIColor(cgColor: layer.shadowColor!)
    }
    set {
      layer.shadowColor = newValue?.cgColor
    }
  }

  @IBInspectable public var shadowOpacity: Float {
    get {
      return layer.shadowOpacity
    }
    set {
      layer.shadowOpacity = newValue
    }
  }

  /// The shadow offset. Defaults to (0, -3). Animatable.
  @IBInspectable public var shadowOffset: CGSize {
    get {
      return layer.shadowOffset
    }
    set {
      layer.shadowOffset = newValue
    }
  }

  // The blur radius used to create the shadow. Defaults to 3. Animatable.
  @IBInspectable public var shadowRadius: Double {
    get {
      return Double(layer.shadowRadius)
    }
    set {
      layer.shadowRadius = CGFloat(newValue)
    }
  }

  // The shouldRasterize bool used to give smooth scrolling when applied shadow to a layer.
  @IBInspectable public var shouldRasterize: Bool {
    get {
      return layer.shouldRasterize
    }
    set {
      layer.shouldRasterize = newValue
    }
  }

  // The shouldRasterize bool used to give smooth scrolling when applied shadow to a layer.
  @IBInspectable public var rasterizationScale: CGFloat {
    get {
      return layer.rasterizationScale
    }
    set {
      layer.rasterizationScale = newValue
    }
  }
}
