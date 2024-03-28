//
//  HogumachuTokamakFactory+View.swift
//
//
//  Created by 홍성준 on 3/28/24.
//

import Foundation
import Publish
import TokamakStaticHTML

extension HogumachuTokamakFactory {
  
  struct ItemList: View {
    let items: [Item<Site>]
    let site: Site
    
    var body: some View {
      VStack(alignment: .leading) {
        ForEach(items) { item in
          VStack(alignment: .leading) {
            Link(destination: URL(string: item.path.absoluteString)!) {
              Text(item.title)
                .font(.title)
                .foregroundColor(.black)
            }
            
            Text(item.description)
              .font(.caption)
              .foregroundColor(Color(0x868B94))
            
            TagList(item: item, site: site)
              .padding(.vertical)
          }
          .padding(20)
          .background(Color.white)
          .cornerRadius(20)
        }
      }
    }
  }
  
  struct TagList: View {
    let item: Item<Site>
    let site: Site
    
    var body: some View {
      HStack(spacing: 5) {
        ForEach(item.tags) { tag in
          Tag(tag: tag, site: site)
        }
      }
    }
  }
  
  struct Header: View {
    let context: PublishingContext<Site>
    let selectedID: Site.SectionID?
    let sectionIDs = Site.SectionID.allCases
    
    var body: some View {
      HStack(alignment: .center) {
        Link(destination: URL(string: "/", relativeTo: context.site.url)!) {
          RoundedRectangle(cornerRadius: 25)
            .frame(width: 50, height: 50)
        }
        .padding(.trailing)
        
        if sectionIDs.count > 1 {
          HStack(spacing: 16) {
            ForEach(Array(sectionIDs), id: \.self) { id in
              let section = context.sections[id]
              let destination = URL(string: section.path.absoluteString)!
              Link(destination: destination) {
                Text(section.title)
                  .foregroundColor(id == selectedID ? .blue : .black)
                  .font(.body)
              }
            }
          }
        }
      }
      .padding(.horizontal, 40)
      .padding(.vertical, 30)
      .foregroundColor(.white)
      .frame(minWidth: 0, maxWidth: .infinity)
    }
  }
  
  struct Footer: View {
    let site: Site
    var body: some View {
      VStack {
        HStack {
          Text("Swift를 이용해 만들었어요 -")
            .padding(.trailing)
          Link(destination: URL(string: "https://github.com/johnsundell/publish")!) {
            Text("Publish")
          }
        }
        
        HStack {
          Text("저작권")
            .padding(.horizontal)
          Link(destination: URL(string: "http://www.wtfpl.net")!) {
            Text("WTFPL")
          }
        }
        
        HStack {
          Link(
            "RSS Feed",
            destination: URL(string: "/feed.rss", relativeTo: site.url)!
          )
        }
      }
      .foregroundColor(.white)
    }
  }
  
  struct Tag: View {
    let tag: Publish.Tag
    let site: Site
    
    var body: some View {
      Link(destination: URL(string: site.path(for: tag).absoluteString)!) {
        Text(tag.string)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(Color(0xF2F3F6))
          .foregroundColor(Color(0x868B94))
          .font(.caption)
          .cornerRadius(20)
      }
    }
  }
  
}
