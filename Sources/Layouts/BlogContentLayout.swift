//
//  BlogContentLayout.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct BlogContentLayout: ContentPage {
  func body(content: Content, context: PublishingContext) async -> [any BlockElement] {
    Text(content.title)
      .font(.title1)
      .fontWeight(.bold)
      .foregroundStyle(.textColor)
      .horizontalAlignment(.center)
    
    Text(content.blogDescription)
      .font(.body)
      .foregroundStyle(.gray200)
      .horizontalAlignment(.center)
      .padding(.bottom, .extraLarge)
    
    Group {
      Text(content.body)
    }
    .margin(.medium)
    .padding(.medium)
    .background(.gray400)
    
    Script.comment
  }
}
