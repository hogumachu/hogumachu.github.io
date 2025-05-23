//
//  Image+Local.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

public enum ImageResource: String {
  case cool
  case robot
  case student
  
  var path: String {
    return "/images/\(rawValue).jpg"
  }
}

enum SVGImageResource: String {
  case logo
  case swiftDark
  case swiftLight
  
  var path: String {
    return "/images/svg/\(rawValue).svg"
  }
}

enum ServiceImageResource: String {
  case heatPickIcon = "heat-pick-icon"
  case heatPickService = "heat-pick-service"
  
  var path: String {
    return "/images/service/\(rawValue).png"
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

enum HeroImageResource: String {
  case home
  
  var path: String {
    return "/images/contents/hero/\(rawValue)-hero.jpg"
  }
}

extension Image {
  init(local resource: ImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(local resource: SVGImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(service resource: ServiceImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(background resource: ContentBackgroundImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(hero resource: HeroImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
  
  init(contentIndex index: Int) {
    let count = ContentBackgroundImageResource.allCases.count
    self = .init(
      background: ContentBackgroundImageResource.allCases[index % count]
    )
  }
}
