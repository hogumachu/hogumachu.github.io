//
//  Project+Ignite.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/31/25.
//

import Ignite

extension Career {
  var projectElement: some BlockElement {
    Group {
      Text {
        Link.withImage(url: link.url, name: link.name)
      }
      .font(.title3)
      .fontWeight(.semibold)
      .foregroundStyle(.textColor)
      
      Text {
        role + " | " + "\(start)-\(end)"
      }
      .font(.body)
      .fontWeight(.regular)
      .foregroundStyle(.gray200)
      
      Text(summary)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray100)
      
      skills.map {
        Badge($0)
          .badgeStyle(.default)
          .role(.dark)
          .margin(.trailing, .small)
          .margin(.bottom, .small)
      }
      
      descriptions
        .map {
          $0.projectElement
            .padding(.vertical, .large)
        }
    }
  }
  
}

extension CareerDescription {
  var projectElement: some BlockElement {
    Group {
      Text("■ \(title)")
        .font(.title5)
        .fontWeight(.semibold)
        .foregroundStyle(.primaryColor)
        .padding(.bottom, .small)
      
      components.map {
        Text($0)
          .font(.body)
          .foregroundStyle(.textColor)
      }
    }
  }
}
