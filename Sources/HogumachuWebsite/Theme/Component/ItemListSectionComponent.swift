import Foundation
import Publish
import Plot

struct ItemListSectionComponent<Site: Website>: Component {
    var section: Section<Site>
    var context: PublishingContext<Site>
    
    var body: Component {
        Wrapper {
            H1(section.title)
            ItemList(items: section.items, site: context.site)
        }
    }
    
}
