//
//  ColorAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct ColorAction: Action {
  let id: String
  let color: Color
  
  func compile() -> String {
    """
    const \(id)Color = document.getElementById('\(id)');
    \(id)Color.style.color = '\(color)';
    """
  }
}
