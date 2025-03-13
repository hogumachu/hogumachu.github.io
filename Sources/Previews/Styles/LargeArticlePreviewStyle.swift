//
//  LargeArticlePreviewStyle.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

@MainActor
struct LargeArticlePreviewStyle: @preconcurrency ArticlePreviewStyle {
  
  func body(content: Article) -> any HTML {
    Link(target: content.path) {
      VStack {
        image(content: content)
          .resizable()
          .cornerRadius(16)
        
        Text(content.title)
          .font(.title3)
          .fontWeight(.semibold)
          .foregroundStyle(.bodyEmphasis)
          .padding(.top, .medium)
        
        Text(content.description)
          .font(.body)
          .foregroundStyle(.body)
          .fontWeight(.regular)
          .padding(.top, .small)
      }
      .addHoverAction()
    }
  }
}

