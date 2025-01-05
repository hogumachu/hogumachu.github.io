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
      .foregroundStyle(.textColor)
      .horizontalAlignment(.center)
    
    Text(content.blogDescription)
      .font(.body)
      .foregroundStyle(.gray200)
      .horizontalAlignment(.center)
      .padding(.bottom, .extraLarge)
    
    // TODO: - Markdown Dark Mode 로 변경
    Group {
      Text(content.body)
    }
    .margin(.medium)
    .padding(.medium)
    .background(.gray400)
  }
}
