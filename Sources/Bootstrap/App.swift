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
      try await WebStie().publish()
    } catch {
      print(error.localizedDescription)
    }
  }
}
