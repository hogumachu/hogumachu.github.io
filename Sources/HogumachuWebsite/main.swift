import Foundation
import Publish
import Plot
import SplashPublishPlugin

try HogumachuWebsite().publish(using: [
    .installPlugin(.splash(withClassPrefix: "")),
    .optional(.copyResources()),
    .addMarkdownFiles(),
    .generateHTML(withTheme: Theme(htmlFactory: HogumachuThemeFactory(), resourcePaths: ["Resources/Theme/styles.css"])),
    .generateRSSFeed(including: [.articles]),
    .generateSiteMap(),
])
