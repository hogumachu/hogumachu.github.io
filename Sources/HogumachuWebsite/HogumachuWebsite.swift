import Foundation
import Publish
import Plot

struct HogumachuWebsite: Website {
    
    enum SectionID: String, WebsiteSectionID {
        case articles
        case projects
        case algorithm
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        
    }

    var url = URL(string: "https://hogumachu.github.io/")!
    var name = "HogumachuBlog"
    var description = "A description of HogumachuBlog"
    var language: Language { .korean }
    var imagePath: Path? { nil }
    
}
