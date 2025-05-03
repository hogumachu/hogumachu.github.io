//
//  ArticlePreviewStyle+.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

extension ArticlePreviewStyle {
  
  @MainActor
  func image(content: Article) -> Image {
    if let image = content.image {
      return Image(image, description: "This is article image.")
    } else {
      return Image(background: .robot) // TODO: - Setup default background image
    }
  }
}
