//
//  NavigationBarComponent.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

struct NavigationBarComponent: HTML {
  @Environment(\.page) var currentPage
  
  var body: some HTML {
    NavigationBar(logo: logo) {
      linkComponent(BlogPage())
      linkComponent(ServicePage())
      linkComponent("GitHub", target: "https://github.com/hogumachu")
      linkComponent("Tistory", target: "https://hogumachu.tistory.com")
    }
    .navigationItemAlignment(.trailing)
    .navigationBarStyle(.dark)
    .background(.background)
    .position(.fixedTop)
    .padding(.horizontal, .medium)
  }
  
  private var logo: some InlineElement {
    Image(local: .logo)
      .addHoverAction()
  }
  
  private func linkComponent(_ page: any StaticPage) -> Link {
    Link(page: page) {
      Text(page.title)
        .font(.title6)
        .fontWeight(currentPage.url.path == page.path ? .semibold : .regular)
        .foregroundStyle(
          currentPage.url.path == page.path ? .primary : .body
        )
        .addHoverAction()
    }
  }
  
  private func linkComponent(_ title: String, target: String) -> Link {
    Link(target: target) {
      Text(title)
        .font(.title6)
        .fontWeight(.regular)
        .addHoverAction()
    }
  }
}
