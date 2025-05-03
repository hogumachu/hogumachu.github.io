//
//  ScaleAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

struct ScaleAction: Action {
  let id: String
  let scale: Double
  
  func compile() -> String {
    """
    const \(id)Scale = document.getElementById('\(id)');
    \(id)Scale.style.transform = 'scale(\(scale.formatted())';
    """
  }
}
