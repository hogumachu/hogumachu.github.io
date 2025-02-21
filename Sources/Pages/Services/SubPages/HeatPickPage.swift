//
//  HeatPickPage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/8/25.
//

import Foundation
import Ignite

struct HeatPickPage: StaticLayout {
  let title = "HeatPick"
  
  var body: some HTML {
    Text("HeatPick")
      .horizontalAlignment(.center)
      .font(.title1)
      .fontWeight(.bold)
    
    Text("2023.11.06 ~ 2023.12.15")
      .horizontalAlignment(.center)
      .font(.body)
      .padding(.bottom, .small)
    
    Text {
      Image(bootstrap: .github)
        .resizable()
        .frame(maxWidth: 50)
      
      " GitHub 보러가기"
    }
    .id("github")
    .horizontalAlignment(.center)
    .font(.body)
    .onClick {
      NavigationAction(link: "https://github.com/boostcampwm2023/iOS04-HeatPick")
    }
    .onHover { isHovering in
      OpacityAction(id: "github", opacity: isHovering ? 0.6 : 1.0)
      CursorAction(id: "github", isHovering: isHovering)
    }
    
    Text {
      Image(bootstrap: .book)
        .resizable()
        .frame(maxWidth: 50)
      
      " Wiki 보러가기"
    }
    .id("wiki")
    .horizontalAlignment(.center)
    .font(.body)
    .padding(.bottom, .small)
    .onClick {
      NavigationAction(link: "https://github.com/boostcampwm2023/iOS04-HeatPick/wiki")
    }
    .onHover { isHovering in
      OpacityAction(id: "wiki", opacity: isHovering ? 0.6 : 1.0)
      CursorAction(id: "wiki", isHovering: isHovering)
    }
    
    Text("발표 자료")
      .font(.title1)
      .fontWeight(.bold)
      .padding(.top, .xLarge)
    
    Text("제가 발표한 영상이에요. 가장 쉽고 빠르게 프로젝트에 대해 확인할 수 있어요.")
      .font(.body)
      .padding(.bottom, .medium)
    
    Embed(
      youTubeID: "m6ca5L3O2C8",
      title: "HeatPick 발표 영상"
    )
    .aspectRatio(.r16x9)
    
    Text("프로젝트 설명")
      .font(.title1)
      .fontWeight(.bold)
      .padding(.top, 100)
    
    Image(service: .heatPickService)
      .aspectRatio(.r16x9)
      .padding(.top, .medium)
    
    Text("HeatPick는 한 달이라는 짧은 시간에 많은 기능을 개발했어요.")
      .font(.title5)
      .fontWeight(.semibold)
      .padding(.top, .large)
    
    Text("지도 클러스터링, SNS의 필수 요소인 좋아요와 팔로잉 그리고 댓글<br/>또 스토리 작성과 성장 기반 칭호 시스템 기능도 개발했어요.")
      .font(.body)
    
    Text("저는 이러한 역할을 했어요")
      .font(.title1)
      .fontWeight(.bold)
      .padding(.top, 100)
    
    roleContent("기획", description: "전체적인 프로젝트를 기획했어요.<br/>팀 빌딩, 일정 관리 그리고 디자인까지<br/>지속적으로 팀원에게 피드백을 받으며 작업했어요.")
      .padding(.top, .medium)
    
    roleContent("아키텍처 설계", description: "RIBs 및 클린 아키텍처를 활용하여 독립적인 개발 환경을 구성했어요.")
      .padding(.top, .medium)
    
    Group {
      roleContent("모듈화", description: "Tuist를 활용하여 모듈화 및 데모앱 구조를 설계했어요.")
      
      Table {
        Row {
          Column {
            "빌드 속도 개선"
          }
          .verticalAlignment(.middle)
          
          Column {
            "빌드 속도를 25% 개선했어요(20s -> 15s)"
          }
          .verticalAlignment(.middle)
        }
        Row {
          Column {
            "물리적인 기능 분리"
          }
          .verticalAlignment(.middle)
          
          Column {
            "물리적인 기능 분리를 통해 사이드 이펙트를 제거했어요.<br/>더욱 안전하게 코드를 작성할 수 있도록 만들었어요."
          }
          .verticalAlignment(.middle)
        }
      }
      .tableStyle(.stripedColumns)
      .tableBorder(true)
    }
    .padding(.top, .medium)
    
    roleContent("네트워크 설계", description: "URLProtocol을 활용하여 네트워크 테스트 및 서버 중단 시에도 개발 가능하도록 설계했어요.")
      .padding(.top, .medium)
      .padding(.bottom, .xLarge)
    
    Divider()
    
    Group {
      Text("그 밖에도")
        .font(.title2)
        .fontWeight(.semibold)
      
      Text("정말 적은 부분만 담았어요.<br/>지도 클러스터링, 모듈 템플릿, 아키텍처 구조 등 많은 부분을 아래에 정리해 뒀어요.")
        .font(.body)
        .fontWeight(.regular)
      
      Link("구경하기", target: "https://github.com/boostcampwm2023/iOS04-HeatPick/wiki")
        .linkStyle(.button)
        .buttonSize(.medium)
        .role(.primary)
    }
    .horizontalAlignment(.center)
    .padding(.top, .xLarge)
  }
  
  private func roleContent(_ title: String, description: String) -> some BlockHTML {
    Group {
      Text(title)
        .font(.title6)
        .fontWeight(.semibold)
      
      Text(description)
        .font(.body)
    }
  }
}
