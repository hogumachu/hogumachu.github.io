//
//  NavigationBarComponent.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

struct NavigationBarComponent: Component {
  func body(context: PublishingContext) -> [any PageElement] {
    NavigationBar(logo: logo) {
      Link(target: "https://github.com/hogumachu") {
        Image(resource: .github)
          .resizable()
          .foregroundStyle(.gray100)
      }
    }
    .navigationItemAlignment(.trailing)
    .navigationBarStyle(.dark)
    .background(.gray400)
    .position(.fixedTop)
  }
  
  private var logo: some InlineElement {
    Text("🌎 Hogumachu Blog")
      .font(.title3)
      .foregroundStyle(.primaryColor)
  }
}
