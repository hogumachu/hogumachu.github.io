import Foundation
import Publish
import Plot

struct ItemTagList<Site: Website>: Component {
  let item: Item<Site>
  let site: Site
  
  var body: Component {
    List(item.tags) { tag in
      Link(tag.string, url: site.path(for: tag).absoluteString)
    }
    .class("tag-list")
  }
}
