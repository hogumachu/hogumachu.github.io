//
//  BlogPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct BlogPage: StaticPage {
  let title = "Blog"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("BlogPage")
      .font(.title1)
      .foregroundStyle(.textColor)
  }
}
