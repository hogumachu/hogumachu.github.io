import Foundation
import Publish
import Plot

struct HogumachuThemeFactory: HTMLFactory {
  
  typealias Site = HogumachuWebsite
  
  func makeIndexHTML(
    for index: Index,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: index, on: context.site),
      .body { HomeComponent(context: context) }
    )
  }
  
  
  func makeSectionHTML(
    for section: Section<Site>,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: section, on: context.site),
      .body {
        SiteHeader(context: context, selectedSelectionID: section.id)
        SectionItem(section: section, context: context)
        SiteFooter()
      }
    )
  }
  
  func makeItemHTML(
    for item: Item<Site>,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: item, on: context.site),
      .body(
        .class("item-page"),
        .components {
          SiteHeader(context: context, selectedSelectionID: item.sectionID)
          Wrapper {
            Article {
              H1(item.title)
              ItemTagList(item: item, site: context.site)
              Div(item.content.body).class("content")
            }
          }
          SiteFooter()
        }
      )
    )
  }
  
  func makePageHTML(
    for page: Page,
    context: PublishingContext<Site>
  ) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: page, on: context.site),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
        Wrapper(page.body)
        SiteFooter()
      }
    )
  }
  
  func makeTagListHTML(
    for page: TagListPage,
    context: PublishingContext<Site>
  ) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: page, on: context.site),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
        Wrapper {
          H1("모든 태그")
          List(page.tags.sorted()) { tag in
            ListItem {
              Link(tag.string,
                   url: context.site.path(for: tag).absoluteString
              )
            }
            .class("tag")
          }
          .class("all-tags")
        }
        SiteFooter()
      }
    )
  }
  
  func makeTagDetailsHTML(
    for page: TagDetailsPage,
    context: PublishingContext<Site>
  ) throws -> HTML? {
    HTML(
      .lang(context.site.language),
      .headWithStylesheets(for: page, on: context.site),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
        Wrapper {
          H1 {
            Text("태그: ")
            Span(page.tag.string).class("tag")
          }
          
          Link("모든 태그 보기",
               url: context.site.tagListPath.absoluteString
          )
          .class("browse-all")
          
          ItemList(
            items: context.items(
              taggedWith: page.tag,
              sortedBy: \.date,
              order: .descending
            ),
            site: context.site
          )
        }
        SiteFooter()
      }
    )
  }
}
