//
//  MainLayout.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

// TODO: - Theme 설정

struct MainLayout: Layout {
  var body: some HTML {
    HTMLDocument(language: .korean) {
      HTMLHead(for: page)
      
      HTMLBody {
        NavigationBarComponent()
        
        Section(page.body)
      }
      .padding(.vertical, 70)
      .padding(.horizontal, .medium)
      .class("container")
    }
    .background(.gray400)
  }
//  func render(page: Page, context: PublishingContext) async -> HTML {
//    HTML(type: .dark) {
//      Head(for: page, in: context)
//      
//      Body {
//        NavigationBarComponent()
//        
//        page.body
//      }
//      .background(.gray400)
//      .padding(.vertical, 70)
//      .padding(.horizontal, .medium)
//      .class("container")
//    }
//    .background(.gray400)
//  }
}
