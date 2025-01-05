import Foundation
import Ignite

struct HomePage: StaticPage {
  let title = "Home"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    header
    
    migration
      .padding(.top, 120)
    
    pageDescriptionTitle
      .padding(.top, 200)
    
    pageDescriptionCarousel
  }
  
  private var header: some BlockElement {
    Group {
      Text("호구마츄테크,")
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
      
      Text("Swift, iOS 이야기를 주로 해요")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
    }
  }
  
  private var migration: some BlockElement {
    Group {
      Text("⚠️ 아직 작업 중이에요 ⚠️")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text("이전에 있던 블로그 자료를 이전하고 있어요. 아래 링크를 통해 확인할 수 있어요")
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray100)
      
      Link("구경하기", target: "https://hogumachu.tistory.com")
        .linkStyle(.button)
        .buttonSize(.medium)
        .role(.success)
    }
    .horizontalAlignment(.center)
  }
  
  private var pageDescriptionTitle: some BlockElement {
    Group {
      Text("공유하는 것")
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.textColor)
      
      Text("개발자 그리고 직장인으로 겪은 모든 것을 공유해요")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text("단순히 iOS 개발을 넘어 더 좋은 팀원이 되기 위한 고군분투에 대해 공유해요.")
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray200)
    }
    .horizontalAlignment(.center)
  }
  
  private var pageDescriptionCarousel: some BlockElement {
    Carousel {
      pageDescriptionSlide(
        target: BlogPage(),
        resource: .cool,
        title: "블로그",
        description: "Swift, iOS에 대한 이야기 이외에도 많은 내용을 공유해요. 특히 일을 하다 겪은 일이나 인사이트 등 다양한 생각들을 정리하고 공유해요."
      )
      
      pageDescriptionSlide(
        target: ServicePage(),
        resource: .robot,
        title: "서비스",
        description: "개발한 제품에 대해 공유해요. 개인 프로젝트 뿐만 아니라 재직을 하며 개발했던 서비스를 공유해요."
      )
      
      pageDescriptionSlide(
        target: CareerPage(),
        resource: .student,
        title: "경력",
        description: "여태까지 개발자로 걸어온 길을 공유해요. 어떤 역할을 통해 어떤 성취를 이뤘는 지 공유해요."
      )
    }
  }
  
  private func pageDescriptionSlide(
    target: any StaticPage,
    resource: ImageResource,
    title: String,
    description: String
  ) -> Slide {
    Slide(background: resource.path) {
      Text(title)
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text(description)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray100)
      
      Text {
        Link("보러가기", target: target)
          .linkStyle(.button)
          .buttonSize(.medium)
          .role(.light)
      }
    }
    .backgroundOpacity(0.1)
  }
}
