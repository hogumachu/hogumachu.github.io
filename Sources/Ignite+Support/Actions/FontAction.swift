//
//  FontAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
@preconcurrency import Ignite

//struct FontAction: Action {
//  let id: String
//  let font: Font
//  
//  func compile() -> String {
//    """
//    const \(id)Font = document.getElementById('\(id)');
//    \(id)Font.style.font = "\(font.rawValue)";
//    """
//  }
//}

struct FontWeightAction: Action {
  let id: String
  let fontWeight: Font.Weight
  
  func compile() -> String {
    """
    const \(id)FontWeight = document.getElementById('\(id)');
    \(id)FontWeight.style.font-weight = "\(fontWeight.rawValue)";
    """
  }
}
