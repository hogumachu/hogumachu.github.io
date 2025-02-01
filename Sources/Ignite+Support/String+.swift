//
//  String+.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/26/25.
//

import Foundation

extension String {
  var strong: String {
    return "<strong>" + self + "</strong>"
  }
  
  var br: String {
    return self + "</br>"
  }
}
