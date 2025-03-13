//
//  BlogPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
@preconcurrency import Ignite

struct BlogPage: StaticPage {
  @Environment(\.themes) var themes
  @Environment(\.articles) var articles
  
  let title = "Blog"
  
  var body: some HTML {
    VStack {
      PageHeader(
        title: "블로그",
        subtitle: "좋은 제품을 만들기 위해 했던 노력을 공유해요."
      )
      .padding(.top, .xLarge)
      .padding(.bottom, .xLarge)
      
      Grid {
        ForEach(articles.all.sorted(by: { $0.date > $1.date })) {
          ArticlePreview(for: $0)
            .previewStyle(.large)
            .padding()
        }
      }
      .columns(2)
      .padding(.top, .xLarge)
    }
  }
}
