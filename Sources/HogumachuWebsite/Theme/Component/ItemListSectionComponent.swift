import Foundation
import Publish
import Plot

struct ItemListSectionComponent<Site: Website>: Component {
  let section: Section<Site>
  let context: PublishingContext<Site>
  
  var body: Component {
    Wrapper {
      H1(section.title)
      ItemList(items: section.items.sorted(by: { $0.date > $1.date}), site: context.site)
    }
  }
  
}
