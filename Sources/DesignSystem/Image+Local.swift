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

extension Image {
  init(local resource: ImageResource) {
    self.init(resource.path, description: resource.rawValue + " image")
  }
}
