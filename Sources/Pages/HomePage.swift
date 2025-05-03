import Foundation
@preconcurrency import Ignite

struct HomePage: StaticPage {
  
  private enum Constants {
    static let contentCount = 3
  }
  
  @Environment(\.articles) var articles
  
  let title = "Home"
  
  var body: some HTML {
    header
      .padding(100)
    
    SectionHeader(
      category: "공유하는 것",
      title: "개발자 그리고 직장인으로 겪은 모든 것을 공유해요",
      subtitle: "단순히 iOS 개발을 넘어 더 좋은 팀원이 되기 위한 고군분투에 대해 공유해요."
    )
    .padding(.top, .xLarge)
    
    pageDescriptionCarousel
      .padding(.top, .xLarge)
      .padding(.bottom, .xLarge)
    
    SectionHeader(
      category: "최근 게시글",
      title: "최근에 어떤 생각을 하며 개발을 하는 지 공유해요",
      subtitle: "개발을 잘하는 것을 넘어 더 좋은 동료로 지내기 위해 열심히 노력하고 있어요."
    )
    .padding(.top, .xLarge)
    
    Grid {
      ForEach(blogArticles) {
        ArticlePreview(for: $0)
          .previewStyle(.small)
          .padding()
      }
    }
    .columns(Constants.contentCount)
    .padding(.top, .medium)
  }
  
  private var header: some HTML {
    Grid {
      VStack {
        Text("Mobile Developer")
          .font(.title6)
          .fontWeight(.thin)
          .padding(.top, .medium)
        
        Text("hogumachu,<br>tech")
          .horizontalAlignment(.center)
          .font(.title1)
          .fontWeight(.heavy)
        
        Text("iOS, Swift에 대한 이야기를 주로 해요.".br + "모바일 개발에 많은 흥미가 있어요.".br + "최근에는 Flutter와 오픈 소스에 관심이 많아요.")
          .horizontalAlignment(.center)
          .font(.body)
          .fontWeight(.regular)
          .padding(.top, .large)
      }
      
      Image(local: .swiftLight)
        .resizable()
        .frame(width: 300, height: 300)
    }
    .columns(2)
  }
  
  private var pageDescriptionCarousel: some HTML {
    Grid {
      HeroView(
        style: .light,
        title: "블로그",
        description: "모바일 개발에 대한 이야기를 주로 해요.".br + "일을 하다 겪은 일이나 인사이트 등 다양한 생각들을 정리하고 공유해요.",
        page: BlogPage()
      )
      HeroView(
        style: .dark,
        title: "서비스",
        description: "개발한 제품에 대해 공유해요.".br + "개인 프로젝트 뿐만 아니라 재직을 하며 개발했던 서비스를 공유해요.",
        page: ServicePage()
      )
    }
    .columns(3)
  }
  
  private var blogArticles: [Article] {
    articles
      .all
      .sorted { $0.date > $1.date }
      .prefix(Constants.contentCount)
      .map { $0 }
  }
}
