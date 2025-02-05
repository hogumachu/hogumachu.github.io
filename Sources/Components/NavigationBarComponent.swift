//
//  NavigationBarComponent.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

struct NavigationBarComponent: HTML {
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
    .background(.gray400)
  }
  
  private var logo: some InlineHTML {
    Text("hogumachu tech")
      .font(.title4)
      .fontWeight(.regular)
//      .foregroundStyle(.textColor)
  }
  
  private var additionalLinks: some NavigationItem {
    Dropdown("More") {
      linkComponent("GitHub", target: "https://github.com/hogumachu")
      linkComponent("Tistory", target: "https://hogumachu.tistory.com")
    }
  }
  
  private func linkComponent(_ page: any StaticLayout) -> Link {
    Link(page: page) {
      Text(page.title)
//        .foregroundStyle(context.currentRenderingPath == page.path ? .primaryColor : .gray200)
    }
  }
  
  private func linkComponent(_ title: String, target: String) -> Link {
    Link(target: target) {
      Text(title)
        .foregroundStyle(.gray200)
    }
  }
}
