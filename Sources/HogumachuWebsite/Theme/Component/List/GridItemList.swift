//
//  GridItemList.swift
//
//
//  Created by 홍성준 on 3/28/24.
//

import Foundation
import Publish
import Plot

struct GridItemList: Component {
  let items: [Item<HogumachuWebsite>]
  let site: HogumachuWebsite
  
  var body: Component {
    List(items) { item in
      Article {
        Link(url: item.path.absoluteString) {
          Image(item.metadata.thumbnail ?? "/Image/empty-image.svg")
            .class("thumbnail")
          H1(item.title)
          Paragraph(item.description)
          ItemTagList(item: item, site: site)
        }
      }
      .class("grid-item")
    }
    .class("grid-item-list")
  }
}
