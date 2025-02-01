//
//  Career.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/26/25.
//

import Ignite

struct Career {
  let link: CompanyLink
  let role: String
  let summary: String
  let skills: [String]
  let descriptions: [CareerDescription]
  let start: String
  let end: String
}

struct CompanyLink {
  let name: String
  let url: String
}

struct CareerDescription {
  let title: String
  let components: [String]
  
  init(
    title: String,
    components: [String]
  ) {
    self.title = title
    self.components = components
      .enumerated()
      .map { offset, element in
        offset == components.count - 1 ? element : element.br
      }
  }
}
