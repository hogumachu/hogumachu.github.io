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
      linkComponent(CareerPage())
      additionalLinks
    }
    .navigationBarStyle(.dark)
    .navigationItemAlignment(.trailing)
    .position(.fixedTop)
    .padding(.horizontal, .medium)
    .background(.black.opacity(0.7)) // TODO: - Theme 설정
  }
  
  private var logo: some InlineElement {
    Text("hogumachu tech")
      .font(.title4)
      .fontWeight(.regular)
      .foregroundStyle(.primaryEmphasis)
      .addHoverAction()
  }
  
  private var additionalLinks: some NavigationItem {
    Dropdown("More") {
      linkComponent("GitHub", target: "https://github.com/hogumachu")
      linkComponent("Tistory", target: "https://hogumachu.tistory.com")
    }
  }
  
  private func linkComponent(_ page: any StaticPage) -> Link {
    Link(page: page) {
      Text(page.title)
        .foregroundStyle(
          currentPage.url.path == page.path ? .primaryEmphasis : .body
        )
        .addHoverAction(scale: 0.97)
    }
  }
  
  private func linkComponent(_ title: String, target: String) -> Link {
    Link(target: target) {
      Text(title)
        .addHoverAction(scale: 0.97)
    }
  }
}
