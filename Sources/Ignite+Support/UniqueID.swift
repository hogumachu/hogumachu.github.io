//
//  UniqueID.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation

public struct UniqueID {
  
  public let string: String
  
  public init() {
    let alpha = (UnicodeScalar("a").value...UnicodeScalar("z").value)
      .compactMap { Unicode.Scalar($0) }
      .map { String($0) }
    
    self.string = (0..<16)
      .map { _ in alpha.randomElement() ?? "" }
      .joined()
  }
}
