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
          .cornerRadius(8)
        
        Text(content.title)
          .horizontalAlignment(.center)
          .font(.title5)
          .fontWeight(.semibold)
          .foregroundStyle(.primary)
          .padding(.top, .small)
        
        Text(content.description)
          .horizontalAlignment(.center)
          .font(.body)
          .fontWeight(.regular)
          .foregroundStyle(.secondary)
      }
      .addHoverAction()
    }
  }
}
