//
//  Career+Ignite.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/26/25.
//

@preconcurrency import Ignite

extension Career {
  @MainActor
  var element: some BlockHTML {
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
        
        skills.map {
          Badge($0)
            .badgeStyle(.default)
            .role(.dark)
            .margin(.trailing, .small)
            .margin(.bottom, .small)
        }
      }
      .position(.stickyTop)
      .padding(.top, 80)
      
      descriptions
        .map {
          $0.element
            .padding(.top, .xLarge)
        }
    }
  }
}

extension CareerDescription {
  @MainActor
  var element: some BlockHTML {
    Group {
      Text(title)
        .font(.title5)
        .fontWeight(.semibold)
      
      components.map {
        Text($0)
          .font(.body)
      }
    }
  }
}
