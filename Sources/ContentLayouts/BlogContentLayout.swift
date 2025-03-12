//
//  BlogContentLayout.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct BlogContentLayout: ArticlePage {
  var body: some HTML {
    Text(article.title)
      .horizontalAlignment(.center)
      .font(.title1)
      .fontWeight(.bold)
    
    Text(article.blogDescription)
      .horizontalAlignment(.center)
      .font(.body)
      .padding(.bottom, .xLarge)
    
    Group {
      Text(article.text)
    }
    .margin(.medium)
    .padding(.medium)
    
    Script.comment
  }
}
