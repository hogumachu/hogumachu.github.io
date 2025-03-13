//
//  ArticlePreview+.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

public enum ArticlePreviewType {
  case small
  case large
  
  @MainActor
  var style: any ArticlePreviewStyle {
    switch self {
    case .small: SmallArticlePreviewStyle()
    case .large: LargeArticlePreviewStyle()
    }
  }
}

public extension ArticlePreview {
  
  func previewStyle(_ type: ArticlePreviewType) -> ArticlePreview {
    articlePreviewStyle(type.style)
  }
}
