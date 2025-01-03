//
//  Image+Resources.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/3/25.
//

import Foundation
import Ignite

/// Bootstrap에서 제공하는 이미지
/// - https://icons.getbootstrap.com/
enum ImageResource: String {
  case apple
  case github
}

extension Image {
  /// Bootstrap에서 제공하는 이미지
  init(resource: ImageResource) {
    self.init(
      systemName: resource.rawValue,
      description: resource.rawValue + " image"
    )
  }
}
