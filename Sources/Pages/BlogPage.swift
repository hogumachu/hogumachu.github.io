//
//  BlogPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct BlogPage: StaticPage {
  let title = "Blog"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    Group {
      Text("Blog")
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
      
      Text("좋은 제품을 만들기 위해 했던 노력을 공유해요.")
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.gray100)
        .horizontalAlignment(.center)
        .padding(.top, .medium)
        .padding(.bottom, .extraLarge)
      
      Section {
        for (index, content) in contents(context).enumerated() {
          ContentPreview(for: content)
            .contentPreviewStyle(PreviewStyle(index: index))
            .width(.max)
            .background(.gray400)
            .padding()
        }
      }
      .columns(2)
    }
  }
  
  private func contents(_ context: PublishingContext) -> [Content] {
    context.content(ofType: "blog").sorted {
      $0.date > $1.date
    }
  }
}

private struct PreviewStyle: ContentPreviewStyle {
  let index: Int
  let imageID = UniqueID().string
  let titleID = UniqueID().string
  let descriptionID = UniqueID().string
  
  func body(content: Content, context: PublishingContext) -> any BlockElement {
    Group {
      Image(contentIndex: index)
        .id(imageID)
        .resizable()
        .cornerRadius(16)
        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.title)
        .id(titleID)
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
        .padding(.top, .small)
        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.description)
        .id(descriptionID)
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.secondaryTextColor)
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
