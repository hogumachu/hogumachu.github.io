//
//  CareerPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct CareerPage: StaticPage {
  let title = "Career"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("CareerPage")
      .font(.title1)
      .foregroundStyle(.gray100)
  }
}
