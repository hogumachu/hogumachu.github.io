//
//  Project+Ignite.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/31/25.
//

@preconcurrency import Ignite

extension Career {
  @MainActor
  var projectElement: some HTML {
    Group {
      Text {
        Link.withImage(url: link.url, name: link.name)
      }
      .font(.title3)
      .fontWeight(.semibold)
      
      Text {
        role + " | " + "\(start)-\(end)"
      }
      .font(.body)
      .fontWeight(.regular)
      
      Text(summary)
        .font(.body)
        .fontWeight(.regular)
      
      ForEach(skills) {
        Badge($0)
          .badgeStyle(.default)
          .role(.dark)
          .margin(.trailing, .small)
          .margin(.bottom, .small)
      }
      
      ForEach(descriptions) {
        $0.projectElement
          .padding(.vertical, .large)
      }
    }
  }
  
}

extension CareerDescription {
  @MainActor
  var projectElement: some HTML {
    Group {
      Text("■ \(title)")
        .font(.title5)
        .fontWeight(.semibold)
        .padding(.bottom, .small)
      
      ForEach(components) {
        Text($0)
          .font(.body)
      }
    }
  }
}
