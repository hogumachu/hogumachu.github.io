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
      .foregroundStyle(.textColor)
    
    Text(content.blogDescription)
      .horizontalAlignment(.center)
      .font(.body)
      .foregroundStyle(.gray200)
      .padding(.bottom, .xLarge)
    
    Group {
      Text(content.body)
    }
    .margin(.medium)
    .padding(.medium)
    .background(.gray400)
    
    Script.comment
  }
}
