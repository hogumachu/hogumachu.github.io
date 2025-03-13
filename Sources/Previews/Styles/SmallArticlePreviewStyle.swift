//
//  SmallArticlePreviewStyle.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

@MainActor
struct SmallArticlePreviewStyle: @preconcurrency ArticlePreviewStyle {
  
  func body(content: Article) -> any HTML {
    Link(target: content) {
      VStack {
        image(content: content)
          .resizable()
          .cornerRadius(16)
        
        Text(content.title)
          .horizontalAlignment(.center)
          .font(.title4)
          .fontWeight(.regular)
          .foregroundStyle(.bodyEmphasis)
          .padding(.top, .large)
        
        Text(content.description)
          .horizontalAlignment(.center)
          .font(.lead)
          .fontWeight(.regular)
          .foregroundStyle(.secondary)
          .padding(.top, .small)
      }
      .padding(30)
      .background(.ultraThickMaterial)
      .cornerRadius(16)
      .addHoverAction()
    }
  }
}
