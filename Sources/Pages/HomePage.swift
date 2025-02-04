import Foundation
import Ignite

struct HomePage: StaticPage {
  let title = "Home"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    header
    
    pageDescriptionTitle
      .padding(.top, 120)
    
    pageDescriptionCarousel
      .padding(.top, .large)
    
    recentBlogTitle
      .padding(.top, 200)
    
    recentBlogSection(context)
      .padding(.top, .large)
  }
  
  private var header: some BlockElement {
    Group {
      Text("호구마츄테크,")
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
      
      Text("Swift, iOS 이야기를 주로 해요")
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.gray100)
        .horizontalAlignment(.center)
    }
  }
  
  private var pageDescriptionTitle: some BlockElement {
    Group {
      Text("공유하는 것")
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.primaryColor)
      
      Text("개발자 그리고 직장인으로 겪은 모든 것을 공유해요")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text("단순히 iOS 개발을 넘어 더 좋은 팀원이 되기 위한 고군분투에 대해 공유해요.")
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.secondaryTextColor)
    }
    .horizontalAlignment(.center)
  }
  
  private var pageDescriptionCarousel: some BlockElement {
    Carousel {
      pageDescriptionSlide(
        target: BlogPage(),
        resource: .cool,
        title: "블로그",
        description: "Swift, iOS에 대한 이야기 이외에도 많은 내용을 공유해요.".br + "특히 일을 하다 겪은 일이나 인사이트 등 다양한 생각들을 정리하고 공유해요."
      )
      
      pageDescriptionSlide(
        target: ServicePage(),
        resource: .robot,
        title: "서비스",
        description: "개발한 제품에 대해 공유해요.".br + "개인 프로젝트 뿐만 아니라 재직을 하며 개발했던 서비스를 공유해요."
      )
      
      pageDescriptionSlide(
        target: CareerPage(),
        resource: .student,
        title: "경력",
        description: "여태까지 개발자로 걸어온 길을 공유해요.</br>어떤 역할을 통해 어떤 성취를 이뤘는 지 공유해요."
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
        .foregroundStyle(.secondaryTextColor)
      
      Text {
        Link("보러가기", target: target)
          .linkStyle(.button)
          .buttonSize(.medium)
          .role(.primary)
      }
    }
    .backgroundOpacity(0.2)
  }
  
  private var recentBlogTitle: some BlockElement {
    Group {
      Text("최근 게시글")
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.primaryColor)
      
      Text("최근에 어떤 생각을 하며 개발을 하는 지 공유해요")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text("개발을 잘하는 것을 넘어 더 좋은 동료로 지내기 위해 열심히 노력하고 있어요.")
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.secondaryTextColor)
    }
    .horizontalAlignment(.center)
  }
  
  private func recentBlogSection(_ context: PublishingContext) -> some BlockElement {
    Section {
      for (index, content) in recentBlogContents(context).enumerated() {
        ContentPreview(for: content)
          .contentPreviewStyle(BlogPreviewStyle(index: index))
          .background(.gray400)
          .padding(.extraSmall)
      }
    }
    .columns(4)
  }
  
  private func recentBlogContents(_ context: PublishingContext) -> [Content] {
    context.content(ofType: "blog").sorted {
      $0.date > $1.date
    }
    .prefix(4)
    .map { $0 }
  }
}

private struct BlogPreviewStyle: ContentPreviewStyle {
  let index: Int
  let imageID = UniqueID().string
  let titleID = UniqueID().string
  let descriptionID = UniqueID().string
  
  func body(content: Content, context: PublishingContext) -> any BlockElement {
    Group {
      Image(contentIndex: index)
        .id(imageID)
        .resizable()
        .cornerRadius(8)
        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.title)
        .id(titleID)
        .font(.title5)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
        .padding(.top, .small)
        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.description)
        .id(descriptionID)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.secondaryTextColor)
        .horizontalAlignment(.center)
        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
    }
  }
}

private extension PageElement {
  func contentAction(content: Content, imageID: String, titleID: String, descriptionID: String) -> Self {
    self.onHover { isHovering in
      OpacityAction(id: imageID, opacity: isHovering ? 0.8 : 1.0)
      ColorAction(id: titleID, color: isHovering ? .gray200 : .textColor)
      ColorAction(id: descriptionID, color: isHovering ? .gray200 : .secondaryTextColor)
      CursorAction(id: imageID, isHovering: isHovering)
      CursorAction(id: titleID, isHovering: isHovering)
      CursorAction(id: descriptionID, isHovering: isHovering)
    }
    .onClick {
      NavigationAction(link: content.path)
    }
  }
}
