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
      Dropdown("개발") {
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
      }
      .foregroundStyle(.gray100)
      
      Dropdown("개발2") {
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
      }
      .foregroundStyle(.gray100)
      
      Link("GitHub", target: "https://github.com/hogumachu")
        .foregroundStyle(.gray100)
    }
    .navigationItemAlignment(.trailing)
    .navigationBarStyle(.dark)
    .background(.gray400)
    .position(.fixedTop)
  }
  
  private var logo: some InlineElement {
    Text("🌎 Hogumachu Blog")
      .font(.title2)
      .foregroundStyle(.primaryColor)
  }
}
