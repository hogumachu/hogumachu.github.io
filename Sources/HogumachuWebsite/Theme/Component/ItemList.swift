import Foundation
import Publish
import Plot

struct ItemList<Site: Website>: Component {
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
    .class("item-list")
  }
}
