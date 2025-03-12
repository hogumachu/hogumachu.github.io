//
//  BlogPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
@preconcurrency import Ignite

struct BlogPage: StaticPage {
  @Environment(\.articles) var articles
  let title = "Blog"
  
  var body: some HTML {
    Group {
      Text("Blog")
        .horizontalAlignment(.center)
        .font(.title1)
        .fontWeight(.bold)
      
      Text("좋은 제품을 만들기 위해 했던 노력을 공유해요.")
        .horizontalAlignment(.center)
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.bodyEmphasis)
        .padding(.top, .medium)
        .padding(.bottom, .xLarge)
      
      Grid {
        ForEach(
          articles.all.sorted(by: { $0.date > $1.date }).enumerated()
        ) { index, article in
          ArticlePreview(for: article)
            .articlePreviewStyle(PreviewStyle(index: index))
            .padding()
        }
      }
      .columns(2)
    }
  }
}

private struct PreviewStyle: @preconcurrency ArticlePreviewStyle {
  let index: Int
  
  @MainActor
  func body(content: Article) -> any HTML {
    Group {
      Image(contentIndex: index)
        .resizable()
        .cornerRadius(16)
      
      Text(content.title)
        .font(.title3)
        .fontWeight(.semibold)
        .padding(.top, .small)
      
      Text(content.description)
        .font(.body)
        .fontWeight(.regular)
    }
  }
}
