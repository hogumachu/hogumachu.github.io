import Foundation
import Publish
import Plot

struct AboutComponent<Site: Website>: Component {
    var section: Section<Site>
    var context: PublishingContext<Site>
    
    var body: Component {
        Wrapper {
            Article {
                H1(section.title)
                Div(section.body).class("content")
            }
        }
    }
}
