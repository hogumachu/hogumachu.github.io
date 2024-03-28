import Foundation
import Publish
import Plot

struct SiteFooter: Component {
  var body: Component {
    Footer {
      Paragraph {
        Text("Swift를 이용해 만들었어요 - ")
        Link("Publish", url: "https://github.com/johnsundell/publish")
      }
      Paragraph {
        Text("저작권 - ")
        Link("WTFPL", url: "http://www.wtfpl.net/")
      }
      Paragraph {
        Link("RSS feed", url: "/feed.rss")
      }
    }
  }
}
