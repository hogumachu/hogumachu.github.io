//
//  BlogPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
@preconcurrency import Ignite

struct BlogPage: StaticLayout {
  @Environment(\.content) var content
  let title = "Blog"
  
  var body: some HTML {
    Group {
      Text("Blog")
        .horizontalAlignment(.center)
        .font(.title1)
        .fontWeight(.bold)
      
      Text("좋은 제품을 만들기 위해 했던 노력을 공유해요.")
        .horizontalAlignment(.center)
        .font(.title4)
        .fontWeight(.semibold)
        .padding(.top, .medium)
        .padding(.bottom, .xLarge)
      
      Grid {
        ForEach(contents(content)) { index, item in
          ContentPreview(for: item)
            .contentPreviewStyle(PreviewStyle(index: index))
            .width(.max)
            .padding()
        }
      }
      .columns(2)
    }
  }
  
  private func contents(_ content: ContentLoader) -> EnumeratedSequence<[Content]> {
    content.typed("blog").sorted {
      $0.date > $1.date
    }
    .enumerated()
  }
}

private struct PreviewStyle: @preconcurrency ContentPreviewStyle {
  let index: Int
  let imageID = UniqueID().string
  let titleID = UniqueID().string
  let descriptionID = UniqueID().string
  
  @MainActor
  func body(content: Content) -> any BlockHTML {
    Group {
      Image(contentIndex: index)
        .id(imageID)
        .resizable()
        .cornerRadius(16)
//        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.title)
        .id(titleID)
        .font(.title3)
        .fontWeight(.semibold)
        .padding(.top, .small)
//        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
      
      Text(content.description)
        .id(descriptionID)
        .font(.title6)
        .fontWeight(.regular)
//        .contentAction(content: content, imageID: imageID, titleID: titleID, descriptionID: descriptionID)
    }
  }
}

//private extension PageElement {
//  func contentAction(content: Content, imageID: String, titleID: String, descriptionID: String) -> Self {
//    self.onHover { isHovering in
//      OpacityAction(id: imageID, opacity: isHovering ? 0.8 : 1.0)
//      ColorAction(id: titleID, color: isHovering ? .gray200 : .textColor)
//      ColorAction(id: descriptionID, color: isHovering ? .gray200 : .secondaryTextColor)
//      CursorAction(id: imageID, isHovering: isHovering)
//      CursorAction(id: titleID, isHovering: isHovering)
//      CursorAction(id: descriptionID, isHovering: isHovering)
//    }
//    .onClick {
//      NavigationAction(link: content.path)
//    }
//  }
//}
