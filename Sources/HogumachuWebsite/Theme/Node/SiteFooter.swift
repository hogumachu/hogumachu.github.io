import Foundation
import Publish
import Plot

struct SiteFooter: Component {
    var body: Component {
        Footer {
            Paragraph {
                Text("Using:  ")
                Link("Publish", url: "https://github.com/johnsundell/publish")
            }
            Paragraph {
                Text("Copyright: ")
                Link("WTFPL", url: "http://www.wtfpl.net/")
            }
            Paragraph {
                Link("RSS feed", url: "/feed.rss")
            }
        }
    }
}
