import Foundation
import Publish
import Plot

struct Wrapper: ComponentContainer {
  @ComponentBuilder var content: ContentProvider
  
  var body: Component {
    Div(content: content)
      .class("wrapper")
  }
  
}
