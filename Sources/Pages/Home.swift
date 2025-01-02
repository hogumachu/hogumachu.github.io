import Foundation
import Ignite

struct Home: StaticPage {
  let title = "Home"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Text("Hello hogumachu!")
      .font(.title1)
      .foregroundStyle(.textColor)
    
    Text("Hello world")
      .font(.title2)
      .foregroundStyle(.gray100)
  }
}
