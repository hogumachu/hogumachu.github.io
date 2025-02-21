//
//  BlogContentLayout.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct BlogContentLayout: ContentLayout {
  var body: some HTML {
    Text(content.title)
      .horizontalAlignment(.center)
      .font(.title1)
      .fontWeight(.bold)
    
    Text(content.blogDescription)
      .horizontalAlignment(.center)
      .font(.body)
      .padding(.bottom, .xLarge)
    
    Group {
      Text(content.body)
    }
    .margin(.medium)
    .padding(.medium)
    
    Script.comment
  }
}
