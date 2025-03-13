import Foundation
@preconcurrency import Ignite

struct HomePage: StaticPage {
  
  private enum Constants {
    static let contentCount = 3
  }
  
  @Environment(\.articles) var articles
  
  let title = "Home"
  
  var body: some HTML {
    PageHeader(
      title: "호구마츄테크,",
      subtitle: "Swift, iOS 이야기를 주로 해요"
    )
    
    SectionHeader(
      category: "공유하는 것",
      title: "개발자 그리고 직장인으로 겪은 모든 것을 공유해요",
      subtitle: "단순히 iOS 개발을 넘어 더 좋은 팀원이 되기 위한 고군분투에 대해 공유해요."
    )
    .padding(.top, .xLarge)
    
    pageDescriptionCarousel
    
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
      }
    }
    .columns(Constants.contentCount)
  }
  
  private var pageDescriptionCarousel: some HTML {
    Carousel {
      Slide(
        target: BlogPage(),
        resource: .cool,
        title: "블로그",
        description: "Swift, iOS에 대한 이야기 이외에도 많은 내용을 공유해요.".br + "특히 일을 하다 겪은 일이나 인사이트 등 다양한 생각들을 정리하고 공유해요."
      )
      
      Slide(
        target: ServicePage(),
        resource: .robot,
        title: "서비스",
        description: "개발한 제품에 대해 공유해요.".br + "개인 프로젝트 뿐만 아니라 재직을 하며 개발했던 서비스를 공유해요."
      )
      
      Slide(
        target: CareerPage(),
        resource: .student,
        title: "경력",
        description: "여태까지 개발자로 걸어온 길을 공유해요.</br>어떤 역할을 통해 어떤 성취를 이뤘는 지 공유해요."
      )
    }
  }
  
  private var blogArticles: [Article] {
    articles
      .all
      .sorted { $0.date > $1.date }
      .prefix(Constants.contentCount)
      .map { $0 }
  }
}
