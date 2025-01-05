//
//  Image+Local.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

enum ImageResource: String {
  case cool
  case robot
  case student
  
  var path: String {
    return "/images/\(rawValue).jpg"
  }
}

enum ContentBackgroundImageResource: String, CaseIterable {
  case banana
  case fire
  case party
  case perplex
  case robot
  case strawberry
  
  var path: String {
    return "/images/contents/background/\(rawValue)-background.jpg"
  }
}

extension Image {
  init(local resource: ImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(background resource: ContentBackgroundImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(contentIndex index: Int) {
    let count = ContentBackgroundImageResource.allCases.count
    self = .init(
      background: ContentBackgroundImageResource.allCases[index % count]
    )
  }
}
