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
      VStack(alignment: .leading) {
        HStack {
          Text(content.title)
            .horizontalAlignment(.leading)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.body)
          
          Text(content.dateString)
            .font(.body)
            .foregroundStyle(.body)
            .fontWeight(.thin)
        }
        
        Text(content.description)
          .font(.title5)
          .foregroundStyle(.body)
          .fontWeight(.light)
          .padding(.top, .small)
        
        if let tags = content.tags, !tags.isEmpty {
          Text {
            ForEach(tags) {
              Badge($0)
                .badgeStyle(.subtleBordered)
                .role(.light)
                .fontWeight(.regular)
                .margin(.trailing, 8)
            }
          }
          .padding(.top, .medium)
        }
      }
      .padding(.horizontal, 30)
      .padding(.vertical, 40)
      .background(.secondaryBackground)
      .cornerRadius(16)
      .addHoverAction()
    }
  }
}

