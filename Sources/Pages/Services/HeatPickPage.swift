//
//  HeatPickPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/8/25.
//

import Foundation
import Ignite

struct HeatPickPage: StaticPage {
  let title = "HeatPick"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("HeatPickPage")
      .font(.title1)
      .foregroundStyle(.gray100)
  }
}
