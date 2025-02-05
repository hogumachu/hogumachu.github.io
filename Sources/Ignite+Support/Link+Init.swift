//
//  Link+Init.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite


extension Link {
  init(
    page: any StaticLayout,
    @HTMLBuilder content: @escaping () -> some HTML
  ) {
    self.init(target: page.path, content: content)
  }
  
  init(url: String) {
    self.init(url, target: url)
  }
}

extension Link {
  
  enum LinkImageOrder {
    case left
    case right
  }
  
  static func withImage(
    url: String,
    name: String,
    image: BootstrapImageResource = .link,
    order: LinkImageOrder = .right,
    foregroundStyle: Color = .textColor
  ) -> Link {
    .init(target: url) {
      switch order {
      case .left:
        Text {
          Image(bootstrap: image)
          " \(name)"
        }
        .foregroundStyle(foregroundStyle)
        
      case .right:
        Text {
          "\(name) "
          Image(bootstrap: image)
        }
        .foregroundStyle(foregroundStyle)
      }
    }
    .linkStyle(.underline(.none, hover: .bold))
    .role(.light)
  }
}
