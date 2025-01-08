//
//  ServicePage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct ServicePage: StaticPage {
  let title = "Service"
  
  func body(context: PublishingContext) async -> [any BlockElement] {
    header
      .padding(.bottom, .extraLarge)
    
    projectTitle
      .padding(.top, .extraLarge)
      .padding(.bottom, .extraLarge)
    
    heatPick
      .padding(.top, .extraLarge)
      .padding(.bottom, .extraLarge)
    
    Divider()
  }
  
  private var header: some BlockElement {
    Group {
      Text("Service")
        .font(.title1)
        .fontWeight(.bold)
        .foregroundStyle(.textColor)
        .horizontalAlignment(.center)
      
      Text("제가 참여한 여러 제품에 대해 소개해요.")
        .font(.title4)
        .fontWeight(.semibold)
        .foregroundStyle(.gray100)
        .horizontalAlignment(.center)
        .padding(.top, .medium)
        .padding(.bottom, .extraLarge)
    }
  }
  
  private var projectTitle: some BlockElement {
    Group {
      Text("프로젝트")
        .font(.title6)
        .fontWeight(.regular)
        .foregroundStyle(.primaryColor)
      
      Text("개인 또는 팀으로 진행했던 프로젝트에요")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
      
      Text("어떤 고민이 있었고 어떻게 이를 해결했는지를 공유해요.")
        .font(.body)
        .fontWeight(.regular)
        .foregroundStyle(.gray200)
        .padding(.bottom, .extraLarge)
    }
    .horizontalAlignment(.center)
  }
  
  private var heatPick: some BlockElement {
    Group {
      Image(service: .heatPickIcon)
        .frame(width: 75, height: 75)
      
      Text("HeatPick")
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.textColor)
        .padding(.top, .medium)
      
      Text("위치 기반 SNS 서비스에요. 네이버 부스트캠프 활동을 하며 진행했던 팀 프로젝트에요. 팀 리딩 및 기획 그리고 iOS 개발자의 역할을 했어요.")
        .font(.title5)
        .fontWeight(.regular)
        .foregroundStyle(.gray200)
        .padding(.top, .small)
      
      Section {
        Group {
          Text("RIBs 및 클린 아키텍처 활용")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.textColor)
          
          Text("RIBs 및 클린 아키텍처 활용하여 독립적인 개발 환경 제공했어요. 기능을 최대한 독립적으로 존재할 수 있게 만들었고 테스트 가능한 구조로 만들었어요. 현재 팀에 어울리는 아키텍처에 대해 많은 고민을 했어요.")
            .font(.body)
            .fontWeight(.regular)
            .foregroundStyle(.gray100)
        }
        
        Group {
          Text("Tuist를 활용한 데모앱")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.textColor)
          
          Text("Tuist를 활용하여 모듈화 및 데모앱 구조를 설계했어요. 빌드 속도를 많이 개선시켰으며 물리적인 기능 분리를 통해 사이드 이펙트를 제거했어요. API가 개발 전이거나 오류가 발생한 상황에도 멈추지 않고 개발할 수 있도록 설계했어요.")
            .font(.body)
            .fontWeight(.regular)
            .foregroundStyle(.gray100)
        }
      }
      .columns(2)
      .padding(.top, .large)
      
      Group {
        Text("아직 하지 못한 얘기가 많아요")
          .font(.title5)
          .fontWeight(.semibold)
          .foregroundStyle(.gray100)
          .padding(.top, .extraLarge)
          .padding(.bottom, .medium)
        
        Link("구경하기", target: HeatPickPage())
          .linkStyle(.button)
          .buttonSize(.large)
          .role(.light)
      }
      .horizontalAlignment(.center)
    }
  }
}
