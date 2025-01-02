import Foundation
import Ignite

@main
struct IgniteWebsite {
  static func main() async {
    let site = ExampleSite()
    
    do {
      try await site.publish()
    } catch {
      print(error.localizedDescription)
    }
  }
}

struct ExampleSite: Site {
  var name = "Hello World"
  var titleSuffix = " – My Awesome Site"
  var url = URL(string: "https://hogumachu.github.io")!
  var builtInIconsEnabled = true
  var author = "Hogumachu"
  var homePage = Home()
  var theme: some Theme = SampleTheme()
  let pages: [any StaticPage] = []
}