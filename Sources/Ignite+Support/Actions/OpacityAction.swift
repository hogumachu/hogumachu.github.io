//
//  OpacityAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct OpacityAction: Action {
  let id: String
  let opacity: Double
  
  func compile() -> String {
    """
    const \(id)Opacity = document.getElementById('\(id)');
    \(id)Opacity.style.opacity = \(opacity.formatted());
    """
  }
}
