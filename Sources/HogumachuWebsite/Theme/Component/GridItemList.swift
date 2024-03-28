//
//  GridItemList.swift
//
//
//  Created by 홍성준 on 3/28/24.
//

import Foundation
import Publish
import Plot

struct GridItemList<Site: Website>: Component {
  let items: [Item<Site>]
  let site: Site
  
  var body: Component {
    List(items) { item in
      Article {
        H1(Link(item.title, url: item.path.absoluteString))
        Paragraph(item.description)
        ItemTagList(item: item, site: site)
      }
    }
    .class("grid-item-list")
  }
}
