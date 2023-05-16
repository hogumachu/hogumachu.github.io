import Foundation
import Publish
import Plot

struct SectionItem<Site: Website>: Component {
    var section: Section<Site>
    var context: PublishingContext<Site>
    
    var body: Component {
        switch section.path.string {
        case HogumachuWebsite.SectionID.about.rawValue:
            return AboutComponent(section: section, context: context)
            
        default:
            return ItemListSectionComponent(section: section, context: context)
        }
    }
}
