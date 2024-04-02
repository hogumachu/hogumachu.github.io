//
//  Home.swift
//
//
//  Created by 홍성준 on 3/28/24.
//

import Foundation
import Publish
import Plot

struct HomeComponent: Component {
  
  typealias Site = HogumachuWebsite
  
  let context: PublishingContext<Site>
  
  var body: Component {
    Wrapper {
      SiteHeader(context: context, selectedSelectionID: nil)
      ContentWrapper {
        H1("만나서 반가워요\niOS 개발자 호구마츄입니다")
          .class("home-h1")
        Image("/Image/Home/image1.svg")
          .class("home-image")
        Paragraph("iOS 관련 글을 작성하고 있어요")
          .class("home-text1")
        Paragraph("주로 Swift와 iOS에 관한 글을 작성하고 있어요\n지속 가능한 개발자가 되도록 노력하고 있어요")
          .class("home-text2")
        Link("더 알아보기", url: "/about")
          .class("home-link")
        H2("최근 게시글")
        GridItemList(
          items: context.allItems(
            sortedBy: \.date,
            order: .descending
          ),
          site: context.site
        )
      }
      SiteFooter()
    }
  }
  
}
