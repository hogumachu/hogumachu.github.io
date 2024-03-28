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
  
  var url = URL(string: "https://hogumachu.github.io/")!
  var name = "호구마츄로그"
  var description = "반갑습니다.\niOS 개발자 호구마츄입니다."
  var language: Language { .korean }
  var imagePath: Path? { nil }
  
}
