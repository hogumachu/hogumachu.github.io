//
//  HeroView.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 5/3/25.
//

import Foundation
import Ignite

enum HeroStyle {
  case light
  case dark
}

struct HeroView: HTML {
  let style: HeroStyle
  let title: String
  let description: String
  let page: any StaticPage
  
  var body: some HTML {
    Link(page: page) {
      VStack {
        Text(title)
          .horizontalAlignment(.center)
          .font(.title3)
          .fontWeight(.heavy)
          .foregroundStyle(style == .light ? .dark : .light)
        
        Text(description)
          .horizontalAlignment(.center)
          .font(.body)
          .fontWeight(.regular)
          .foregroundStyle(style == .light ? .dark : .light)
          .padding(.top, .medium)
      }
      .padding(.vertical, .xLarge)
      .padding(.horizontal, .medium)
      .background(style == .light ? .lightBackground : .background)
      .cornerRadius(8)
      .border(.lightBackground.opacity(0.2))
      .addHoverAction()
    }
  }
}
