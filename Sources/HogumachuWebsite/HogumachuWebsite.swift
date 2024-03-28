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
    var thumbnail: String?
  }
  
  let url = URL(string: "https://hogumachu.github.io/")!
  let name = "호구마츄로그"
  let description = "반갑습니다.\niOS 개발자 호구마츄입니다."
  var language: Language { .korean }
  var imagePath: Path? { nil }
  
}
