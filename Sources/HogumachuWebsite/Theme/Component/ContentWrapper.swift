//
//  ContentWrapper.swift
//
//
//  Created by 홍성준 on 4/2/24.
//

import Foundation
import Publish
import Plot

struct ContentWrapper: ComponentContainer {
  @ComponentBuilder var content: ContentProvider
  
  var body: Component {
    Div(content: content)
      .class("content-wrapper")
  }
  
}
