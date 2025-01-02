//
//  SampleTheme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

struct SampleTheme: Theme {
  func render(page: Page, context: PublishingContext) async -> HTML {
    HTML {
      Head(for: page, in: context)
      
      Body {
        page.body
      }
    }
  }
}
