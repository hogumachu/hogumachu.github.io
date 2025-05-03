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
    Body {
      NavigationBarComponent()
        .padding(.bottom, 80)
      
      content
    }
  }
}
