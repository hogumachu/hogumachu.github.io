//
//  App.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

@main
struct App {
  static func main() async {
    do {
      var site = WebStie()
      try await site.publish()
    } catch {
      print(error.localizedDescription)
    }
  }
}
