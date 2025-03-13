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
          .cornerRadius(32)
        
        Text(content.title)
          .font(.title3)
          .fontWeight(.semibold)
          .foregroundStyle(.bodyEmphasis)
          .padding(.top, .large)
        
        Text(content.description)
          .font(.lead)
          .foregroundStyle(.secondary)
          .fontWeight(.regular)
          .padding(.top, .medium)
        
        Text(content.dateString)
          .font(.body)
          .foregroundStyle(.tertiary)
          .fontWeight(.thin)
          .padding(.top, .xSmall)
        
        if let tags = content.tags, !tags.isEmpty {
          Text {
            ForEach(tags) {
              Badge($0)
                .badgeStyle(.default)
                .role(.dark)
                .fontWeight(.thin)
                .margin(.trailing, 8)
            }
          }
          .padding(.top, .medium)
        }
      }
      .padding(30)
      .background(.ultraThickMaterial)
      .cornerRadius(16)
      .addHoverAction()
    }
  }
}

