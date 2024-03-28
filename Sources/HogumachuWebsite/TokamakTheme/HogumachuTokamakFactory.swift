//
//  HogumachuTokamakFactory.swift
//
//
//  Created by 홍성준 on 3/28/24.
//

import Foundation
import Publish
import TokamakStaticHTML

public struct HogumachuTokamakFactory<Site: Website>: TokamakHTMLFactory {
  
  public func makeIndexView(
    for index: Index,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: nil)
    HTMLMeta(charset: "utf-8")
    VStack(alignment: .leading) {
      Text(index.title)
        .font(.headline)
        .bold()
        .padding(.bottom)
      
      Text(context.site.description)
        .font(.caption)
        .padding(.bottom)
      
      Text("Latest content")
        .font(.headline)
      ItemList(
        items: context.allItems(sortedBy: \.date, order: .descending),
        site: context.site
      )
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
  public func makeSectionView(
    for section: Publish.Section<Site>,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: section.id)
    HTMLMeta(charset: "utf-8")
    Text(section.title)
      .font(.headline)
    VStack(alignment: .leading) {
      ItemList(items: section.items, site: context.site)
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
  public func makeItemView(
    for item: Item<Site>,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: item.sectionID)
    HTMLMeta(charset: "utf-8")
    VStack(alignment: .leading) {
      item.body
      Text("Tagged with: ")
      TagList(item: item, site: context.site)
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
  public func makePageView(
    for page: Page,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: nil)
    HTMLMeta(charset: "utf-8")
    VStack(alignment: .leading) {
      page.body
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
  public func makeTagListView(
    for page: TagListPage,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: nil)
    HTMLMeta(charset: "utf-8")
    VStack(alignment: .leading) {
      Text("Browse all tags")
        .font(.headline)
      HStack {
        ForEach(page.tags.sorted()) { tag in
          Tag(tag: tag, site: context.site)
        }
      }
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
  public func makeTagDetailsView(
    for page: TagDetailsPage,
    context: PublishingContext<Site>
  ) throws -> some View {
    Header(context: context, selectedID: nil)
    HTMLMeta(charset: "utf-8")
    VStack(alignment: .leading) {
      HStack {
        Text("Tagged with")
          .padding(.trailing)
        Tag(tag: page.tag, site: context.site)
      }
      .font(.headline)
      Link(
        "Browse all tags",
        destination: URL(string: context.site.tagListPath.absoluteString)!
      )
      ItemList(
        items: context.items(
          taggedWith: page.tag,
          sortedBy: \.date,
          order: .descending
        ),
        site: context.site
      )
    }
    .frame(idealWidth: 1000, maxWidth: 1000)
    .padding(.vertical, 40)
    Footer(site: context.site)
  }
  
}
