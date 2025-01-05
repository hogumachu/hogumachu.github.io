//
//  NavigationAction.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct NavigationAction: Action {
  let link: String
  
  func compile() -> String {
    """
    location.href = '\(link)';
    """
  }
}
