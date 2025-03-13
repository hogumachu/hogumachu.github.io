//
//  ServiceComponent.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

struct ServiceComponentModel {
  let icon: Image
  let title: String
  let descrption: String
  let items: [ServiceComponentItemModel]
  let navigationTitle: String
  let navigationButtonText: String = "구경하기"
  let target: any StaticPage
}

struct ServiceComponentItemModel {
  let title: String
  let description: String
}

struct ServiceComponent: HTML {
  
  let model: ServiceComponentModel
  
  var body: some HTML {
    VStack {
      model.icon
        .frame(width: 50, height: 50)
      
      Text(model.title)
        .font(.title2)
        .fontWeight(.bold)
        .foregroundStyle(.bodyEmphasis)
        .padding(.top, .large)
      
      Text(model.descrption)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.secondary)
        .padding(.top, .small)
      
      Grid {
        ForEach(model.items) { item in
          VStack {
            Text(item.title)
              .font(.title5)
              .fontWeight(.semibold)
              .foregroundStyle(.body)
            
            Text(item.description)
              .font(.body)
              .fontWeight(.regular)
              .foregroundStyle(.secondary)
              .padding(.top, .medium)
          }
        }
      }
      .columns(2)
      .padding(.top, .xLarge)
      
      VStack {
        Text(model.navigationTitle)
          .font(.title5)
          .fontWeight(.regular)
          .foregroundStyle(.primary)
          .padding(.top, .xLarge)
          .padding(.bottom, .medium)
        
        Text {
          Link(model.navigationButtonText, target: model.target)
            .linkStyle(.button)
            .buttonSize(.large)
            .role(.primary)
        }
      }
      .frame(alignment: .center)
    }
  }
}
