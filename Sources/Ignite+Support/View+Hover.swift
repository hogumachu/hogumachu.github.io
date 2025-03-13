//
//  View+Hover.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

public extension HTML {
  
  func addHoverAction(
    _ id: String = UniqueID().string,
    opacity: Double = 0.8,
    scale: Double = 0.997
  ) -> some HTML {
    self.id(id)
    .onHover { isHovering in
      if isHovering {
        OpacityAction(id: id, opacity: opacity)
        ScaleAction(id: id, scale: scale)
      } else {
        OpacityAction(id: id, opacity: 1)
        ScaleAction(id: id, scale: 1)
      }
    }
  }
}
