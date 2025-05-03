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
      VStack(alignment: .leading, spacing: 8) {
        Text(content.title)
          .horizontalAlignment(.leading)
          .font(.title5)
          .fontWeight(.semibold)
          .foregroundStyle(.textColor)
        
        Text(content.description)
          .horizontalAlignment(.leading)
          .font(.body)
          .fontWeight(.regular)
          .foregroundStyle(.textColor)
      }
      .padding(30)
      .background(.secondaryBackground)
      .cornerRadius(4)
      .addHoverAction()
    }
  }
}
