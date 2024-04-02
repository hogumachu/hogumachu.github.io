import Foundation
import Publish
import Plot

struct SectionItem: Component {
  var section: Section<HogumachuWebsite>
  var context: PublishingContext<HogumachuWebsite>
  
  var body: Component {
    switch section.path.string {
    case HogumachuWebsite.SectionID.about.rawValue:
      return AboutComponent(section: section, context: context)
      
    default:
      return ItemListSectionComponent(section: section, context: context)
    }
  }
}
