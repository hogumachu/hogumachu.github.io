//
//  Image+Bootstrap.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/3/25.
//

import Foundation
import Ignite

/// Bootstrap에서 제공하는 이미지
/// - https://icons.getbootstrap.com/
enum BootstrapImageResource: String {
  case apple
  case github
  case book
  case bookFill = "book-fill"
  case phone
  case personWorkspace = "person-workspace"
}

extension Image {
  /// Bootstrap에서 제공하는 이미지
  init(bootstrap resource: BootstrapImageResource) {
    self.init(
      systemName: resource.rawValue,
      description: resource.rawValue + " image"
    )
  }
}
