import Foundation
import Publish
import Plot

struct AboutComponent<Site: Website>: Component {
  let section: Section<Site>
  let context: PublishingContext<Site>
  
  var body: Component {
    Wrapper {
      Article {
        H1("안녕하세요")
          .class("home-h1")
        Image("/Image/About/about-greeting.svg")
          .class("home-image")
        Paragraph("iOS 관련 글을 작성하고 있어요")
          .class("home-text1")
        Paragraph("주로 Swift와 iOS에 관한 글을 작성하고 있어요\n지속 가능한 개발자가 되도록 노력하고 있어요")
          .class("home-text2")
        Paragraph("궁금하신 내용은 아래 연락처를 통해 연락주세요")
          .class("home-text2")
        Div {
          makeLink(url: "mailto:hogumachu@gmail.com", imageName: "mail.svg")
          makeLink(url: "https://github.com/hogumachu", imageName: "github.svg")
          makeLink(url: "https://www.linkedin.com/in/sung-jun-hong-448394235", imageName: "linkedin.svg")
          makeLink(url: "https://hogumachu.tistory.com", imageName: "tistory.svg")
        }.class("about-links")
      }
    }
  }
  
  private func makeLink(url: String, imageName: String) -> Component {
    Link(url: url) {
      Image("/Image/About/\(imageName)")
        .class("about-image")
    }
  }
  
}
