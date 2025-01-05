//
//  ServicePage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct ServicePage: StaticPage {
  let title = "Service"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("ServicePage")
      .font(.title1)
      .foregroundStyle(.gray100)
  }
}
