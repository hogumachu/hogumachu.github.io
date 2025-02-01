//
//  Link+Init.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

typealias InlineElementBuilder = ElementBuilder<InlineElement>

extension Link {
  init(
    page: any StaticPage,
    @InlineElementBuilder content: () -> [any InlineElement]
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
      Text {
        switch order {
        case .left:
          Image(bootstrap: image)
          " \(name)"
          
        case .right:
          "\(name) "
          Image(bootstrap: image)
        }
      }
      .foregroundStyle(foregroundStyle)
    }
    .linkStyle(.hover)
    .role(.light)
  }
}
