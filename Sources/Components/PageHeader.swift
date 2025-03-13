//
//  PageHeader.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

struct PageHeader: HTML {
  
  let title: String
  let subtitle: String
  
  var body: some HTML {
    VStack {
      Text(title)
        .horizontalAlignment(.center)
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.primary)
      
      Text(subtitle)
        .horizontalAlignment(.center)
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
        .padding(.top, .medium)
    }
  }
}
