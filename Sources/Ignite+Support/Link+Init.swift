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
}
