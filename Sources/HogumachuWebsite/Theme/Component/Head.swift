import Foundation
import Publish
import Plot

extension Node where Context == HTML.DocumentContext {
  
  static func headWithStylesheets<T: Website>(for location: Location, on site: T) -> Node {
    return .head(for: location, on: site, stylesheetPaths: ["/Theme/styles.css"])
  }
  
}
