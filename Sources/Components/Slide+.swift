//
//  Slide+.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

public extension Slide {
  
  init(
    target: any StaticPage,
    resource: ImageResource,
    title: String,
    description: String
  ) {
    self = .init(background: resource.path) {
      VStack {
        Text(title)
          .font(.title4)
          .fontWeight(.semibold)
          .foregroundStyle(.bodyEmphasis)
        
        Text(description)
          .font(.body)
          .fontWeight(.regular)
          .foregroundStyle(.body)
          .padding(.top, .small)
        
        Text {
          Link("보러가기", target: target)
            .linkStyle(.button)
            .buttonSize(.medium)
            .role(.light)
        }
        .padding(.top, .medium)
      }
      .padding()
    }
      .backgroundOpacity(0.3)
  }
}
