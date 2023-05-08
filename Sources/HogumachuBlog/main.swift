import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct HogumachuBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://hogumachu.github.io/")!
    var name = "HogumachuBlog"
    var description = "A description of HogumachuBlog"
    var language: Language { .korean }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try HogumachuBlog().publish(withTheme: .foundation)
