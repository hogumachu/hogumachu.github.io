//
//  SectionHeader.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

struct SectionHeader: HTML {
  
  let category: String
  let title: String
  let subtitle: String
  
  var body: some HTML {
    VStack {
      Text(category)
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.primary)
      
      Text(title)
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.bodyEmphasis)
        .padding(.top, .medium)
      
      Text(subtitle)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.secondary)
        .padding(.top, .small)
    }
    .frame(alignment: .center)
  }
}
