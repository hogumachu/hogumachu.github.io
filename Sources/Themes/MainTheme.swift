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
    HTML {
      Head(for: page, in: context)
      
      Body {
        NavigationBarComponent()
        
        page.body
      }
      .padding(.vertical, 80)
      .class("container")
    }
  }
}
