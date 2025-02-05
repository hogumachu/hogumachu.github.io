//
//  CareerPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct CareerPage: StaticLayout {
  let title = "Career"
  
  var body: some HTML {
    header
      .padding(.top, .medium)
    
    introduce
      .padding(.bottom, .xLarge)
    
    Divider()
    
    links
      .padding(.vertical, .xLarge)
    
    Divider()
    
    career
      .padding(.vertical, .xLarge)
    
    Divider()
    
    project
      .padding(.vertical, .xLarge)
    
    Divider()
    
    skills
      .padding(.vertical, .xLarge)
    
    Divider()
    
    educations
      .padding(.vertical, .xLarge)
  }
  
  private var header: some BlockHTML {
    Group {
      Text("iOS 개발자 홍성준")
        .horizontalAlignment(.leading)
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.textColor)
      
      Text("좋은 제품을 만드는 것을 최우선으로 목표하고 있어요.")
        .horizontalAlignment(.leading)
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.gray100)
        .padding(.top, .medium)
    }
  }
  
  private var introduce: some BlockHTML {
    Group {
      Text {
        "개발뿐만 아니라 여러 실험을 통해 개선하며, 동료와 적극적으로 커뮤니케이션하기를 목표로 해요.".br
        "사용자 경험을 개선하고 더 좋은 제품을 만드는 것에 많은 만족감을 느껴요.".br
        "함께 같은 목표를 향해 달릴 수 있는 사람이 되려고 많은 노력을 해요."
      }
      .font(.body)
      .fontWeight(.regular)
      .foregroundStyle(.secondaryTextColor)
      .padding(.top, .medium)
    }
  }
  
  private var links: some BlockHTML {
    Group {
      sectionTitle("링크")
      
      linkComponent(url: "https://github.com/hogumachu", name: "GitHub", image: .github)
      linkComponent(url: "https://www.linkedin.com/in/hogumachu", name: "Linkedin", image: .linkedin)
      linkComponent(url: "mailto:hogumachu@gmail.com", name: "E-mail", image: .mailbox)
    }
  }
  
  private var career: some BlockHTML {
    Group {
      sectionTitle("경력")
      
      Career.ikoob.element
        .padding(.bottom, .xLarge)
      
      Career.orwellHealth.element
        .padding(.vertical, .xLarge)
    }
  }
  
  private var project: some BlockHTML {
    Group {
      sectionTitle("프로젝트")
      
      Career.blog.projectElement
        .padding(.bottom, .large)
      
      Career.simpleNote.projectElement
        .padding(.vertical, .xLarge)
      
      Career.heatPick.projectElement
        .padding(.vertical, .xLarge)
    }
  }
  
  private var skills: some BlockHTML {
    Group {
      sectionTitle("기술")
      
      listSection(
        title: "Swift",
        items: {
          "UIKit, SwiftUI 모두 익숙하게 사용해요."
          "Swift 5.x에서 Swift 6으로 마이레이션한 경험이 있어요."
        }
      )
      .padding(.vertical, .large)
      
      listSection(
        title: "Concurrency",
        items: {
          "RxSwift, Combine 모두 프로덕션에서 활용한 경험이 있어요."
          "최근에는 Async Await을 많이 활용하여 해당 문법에 익숙해요."
        }
      )
      .padding(.vertical, .large)
      
      listSection(
        title: "Architecture",
        items: {
          "MVVM, MVI, RIBs 등 많은 아키텍처를 경험했어요."
          "ReactorKit, TCA, RIBs 등 프로덕션에서 사용한 경험이 있어요."
        }
      )
      .padding(.vertical, .large)
      
      listSection(
        title: "Modularization",
        items: {
          "SPM, Tuist를 활용하여 모듈화를 진행한 경험이 있어요."
          "Clean Architecture, Microfeatures Architecture 등 상황에 적합한 아키텍처를 활용하고 있어요."
        }
      )
      .padding(.vertical, .large)
      
      listSection(
        title: "Test",
        items: {
          "XCTest를 주로 사용했어요."
          "Quick, Nimble을 활용하여 주로 BDD로 테스트를 작성했어요."
          "최근에는 새로운 테스트 코드는 Testing을 활용하여 작성하고 있어요."
        }
      )
      .padding(.vertical, .large)
      
      listSection(
        title: "DevOps",
        items: {
          "Fastlane과 GitHub Actions를 활용하여 CI/CD 구축한 경험이 있어요."
        }
      )
      .padding(.vertical, .large)
    }
  }
  
  private var educations: some BlockHTML {
    Group {
      sectionTitle("교육")
      
      educationSection(
        title: "네이버 커넥트재단 부스트캠프 - iOS 8기 수료",
        subtitle: "2023.07-2023.12",
        items: {
          "읽기 좋은 코드에 대한 학습을 했어요."
          "테스트 가능한 구조에 대한 학습을 했어요."
          "더 나은 커뮤니케이션에 대한 학습을 했어요."
        }
      )
      .padding(.vertical, .large)
      
      educationSection(
        title: "상명대학교 - 컴퓨터과학과(학사) 졸업",
        subtitle: "2016.03-2022.08",
        items: {
          "운영체제, 자료구조, 알고리즘, 네트워크 등 컴퓨터과학 기초 지식에 대한 학습을 했어요."
        }
      )
      .padding(.vertical, .large)
    }
  }
  
  private func sectionTitle(_ title: String) -> some HTML {
    Text(title)
      .font(.title2)
      .fontWeight(.semibold)
      .foregroundStyle(.textColor)
  }
  
  private func listSection(title: String, @HTMLBuilder items: () -> some HTML) -> some BlockHTML {
    Group {
      Text(title)
        .font(.title5)
        .fontWeight(.semibold)
        .foregroundStyle(.primaryColor)
      
      List(items: items)
    }
  }
  
  private func educationSection(
    title: String,
    subtitle: String,
    @HTMLBuilder items: () -> some HTML
  ) -> some BlockHTML {
    Group {
      Text(title)
        .font(.title5)
        .fontWeight(.semibold)
        .foregroundStyle(.primaryColor)
      
      Text(subtitle)
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray100)
      
      List(items: items)
    }
  }
  
  private func linkComponent(url: String, name: String, image: BootstrapImageResource) -> some InlineHTML {
    Text {
      Link.withImage(
        url: url,
        name: name,
        image: image,
        order: .left,
        foregroundStyle: .gray100
      )
    }
    .font(.body)
    .fontWeight(.regular)
  }
}
