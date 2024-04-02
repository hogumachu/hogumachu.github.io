import Foundation
import Publish
import Plot

struct ItemListSectionComponent: Component {
  let section: Section<HogumachuWebsite>
  let context: PublishingContext<HogumachuWebsite>
  
  var body: Component {
    Wrapper {
      H1(section.title)
      GridItemList(
        items: section.items.sorted(by: { $0.date > $1.date}), 
        site: context.site
      )
    }
  }
  
}
