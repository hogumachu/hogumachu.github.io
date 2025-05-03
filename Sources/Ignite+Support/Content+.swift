//
//  Content+.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

extension Article {
  var description: String {
    return metadata["description"] as? String ?? ""
  }
  
  var dateString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
  }
  
  var blogDescription: String {
    return description.isEmpty ? dateString : description + " | " + dateString
  }
}
