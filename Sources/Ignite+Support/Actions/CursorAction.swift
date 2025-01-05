//
//  CursorAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct CursorAction: Action {
  let id: String
  let isHovering: Bool
  
  var cursor: String {
    return isHovering ? "pointer" : "default"
  }
  
  func compile() -> String {
    """
    const \(id)Cursor = document.getElementById('\(id)');
    \(id)Cursor.style.cursor = '\(cursor)';
    """
  }
}
