import Foundation
import Publish
import Plot
import SplashPublishPlugin

try HogumachuWebsite().publish(using: [
    .installPlugin(.splash(withClassPrefix: "")),
    .optional(.copyResources()),
    .addMarkdownFiles(),
    .generateHTML(withTheme: .hogumachu),
    .generateRSSFeed(including: [.articles]),
    .generateSiteMap(),
])
