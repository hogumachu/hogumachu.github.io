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
      linkComponent(BlogPage(), context: context)
      linkComponent(ServicePage(), context: context)
      linkComponent(CareerPage(), context: context)
      additionalLinks
    }
    .navigationItemAlignment(.trailing)
    .navigationBarStyle(.dark)
    .background(.gray400)
    .position(.fixedTop)
  }
  
  private var logo: some InlineElement {
    Text("hogumachu tech")
      .font(.title4)
      .fontWeight(.regular)
      .foregroundStyle(.textColor)
  }
  
  private var additionalLinks: some NavigationItem {
    Dropdown("More") {
      linkComponent("GitHub", target: "https://github.com/hogumachu")
      linkComponent("Tistory", target: "https://hogumachu.tistory.com")
    }
  }
  
  private func linkComponent(_ page: any StaticPage, context: PublishingContext) -> Link {
    Link(page: page) {
      Text(page.title)
        .foregroundStyle(context.currentRenderingPath == page.path ? .primaryColor : .gray200)
    }
  }
  
  private func linkComponent(_ title: String, target: String) -> Link {
    Link(target: target) {
      Text(title)
        .foregroundStyle(.gray200)
    }
  }
}
