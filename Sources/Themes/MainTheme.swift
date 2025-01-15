//
//  MainTheme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

// TODO: - Theme 설정

struct MainTheme: Theme {
  func render(page: Page, context: PublishingContext) async -> HTML {
    HTML(type: .dark) {
      Head(for: page, in: context)
      
      Body {
        NavigationBarComponent()
        
        page.body
      }
      .background(.gray400)
      .padding(.vertical, 80)
      .padding(.horizontal, .medium)
      .class("container")
    }
    .background(.gray400)
  }
}
