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
    NavigationBar(
      logo: Image("add some image", description: "add some image")
    ) {
      Dropdown("개발") {
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
      }
      
      Dropdown("개발2") {
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
        Link("Naver", target: "https://naver.com")
      }
      
      Link("GitHub", target: "https://github.com/hogumachu")
    }
    .navigationItemAlignment(.trailing)
    .navigationBarStyle(.dark)
    .background(.aliceBlue)
    .position(.fixedTop)
  }
}
