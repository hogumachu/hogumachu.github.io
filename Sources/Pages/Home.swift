import Foundation
import Ignite

struct Home: StaticPage {
  var title = "Home"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("Hello hogumachu!")
      .font(.title1)
  }
}
