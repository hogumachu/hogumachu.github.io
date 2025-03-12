//
//  Career+Ignite.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/26/25.
//

@preconcurrency import Ignite

extension Career {
  @MainActor
  var element: some HTML {
    Section {
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
      }
      .position(.stickyTop)
      .padding(.top, 80)
      
      ForEach(descriptions) {
        $0.element
          .padding(.top, .xLarge)
      }
    }
  }
}

extension CareerDescription {
  @MainActor
  var element: some HTML {
    Group {
      Text(title)
        .font(.title5)
        .fontWeight(.semibold)
      
      ForEach(components) {
        Text($0)
          .font(.body)
      }
    }
  }
}
