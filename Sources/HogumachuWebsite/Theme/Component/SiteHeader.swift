import Foundation
import Publish
import Plot

struct SiteHeader<Site: Website>: Component {
  let context: PublishingContext<Site>
  let selectedSelectionID: Site.SectionID?
  
  var body: Component {
    Header {
      Wrapper {
        Link(url: "/") {
          Image("/Image/logo.svg")
        }
        .class("header-logo")
        
        if Site.SectionID.allCases.count > 1 {
          navigation
        }
        Link(url: "#") {
          Image("/Image/align-justify.svg")
        }
        .class("navbar__toggleBtn")
      }
    }
  }
  
  private var navigation: Component {
    Navigation {
      List(Site.SectionID.allCases) { sectionID in
        let section = context.sections[sectionID]
        let className = sectionID == selectedSelectionID ? "selected" : "not-selected"
        
        return Link(
          section.title,
          url: section.path.absoluteString
        )
        .class(className)
      }
    }.class("navbar__menu")
  }
}
