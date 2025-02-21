//
//  ServicePage.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/5/25.
//

import Foundation
import Ignite

struct ServicePage: StaticLayout {
  let title = "Service"
  
  var body: some HTML {
    header
      .padding(.bottom, .xLarge)
    
    projectTitle
      .padding(.top, .xLarge)
      .padding(.bottom, .xLarge)
    
    heatPick
      .padding(.top, .xLarge)
      .padding(.bottom, .xLarge)
    
    Divider()
  }
  
  private var header: some BlockHTML {
    Group {
      Text("Service")
        .horizontalAlignment(.center)
        .font(.title1)
        .fontWeight(.bold)
      
      Text("제가 참여한 여러 제품에 대해 소개해요.")
        .horizontalAlignment(.center)
        .font(.title4)
        .fontWeight(.semibold)
        .padding(.top, .medium)
        .padding(.bottom, .xLarge)
    }
  }
  
  private var projectTitle: some HTML {
    Group {
      Text("프로젝트")
        .font(.title6)
        .fontWeight(.regular)
      
      Text("개인 또는 팀으로 진행했던 프로젝트에요")
        .font(.title2)
        .fontWeight(.semibold)
      
      Text("어떤 고민이 있었고 어떻게 이를 해결했는지를 공유해요.")
        .font(.body)
        .fontWeight(.regular)
        .padding(.bottom, .xLarge)
    }
    .horizontalAlignment(.center)
  }
  
  private var heatPick: some HTML {
    Group {
      Image(service: .heatPickIcon)
        .frame(width: 50, height: 50)
      
      Text("HeatPick")
        .font(.title2)
        .fontWeight(.semibold)
        .padding(.top, .large)
      
      Text("위치 기반 SNS 서비스에요. 네이버 부스트캠프 활동을 하며 진행했던 팀 프로젝트에요. 팀 리딩 및 기획 그리고 iOS 개발자의 역할을 했어요.")
        .font(.body)
        .fontWeight(.regular)
        .padding(.top, .xSmall)
      
      Grid {
        Group {
          Text("RIBs 및 클린 아키텍처 활용")
            .font(.title4)
            .fontWeight(.semibold)
          
          Text("RIBs 및 클린 아키텍처 활용하여 독립적인 개발 환경 제공했어요. 기능을 최대한 독립적으로 존재할 수 있게 만들었고 테스트 가능한 구조로 만들었어요. 현재 팀에 어울리는 아키텍처에 대해 많은 고민을 했어요.")
            .font(.body)
            .fontWeight(.regular)
        }
        
        Group {
          Text("Tuist를 활용한 데모앱")
            .font(.title4)
            .fontWeight(.semibold)
          
          Text("Tuist를 활용하여 모듈화 및 데모앱 구조를 설계했어요. 빌드 속도를 많이 개선시켰으며 물리적인 기능 분리를 통해 사이드 이펙트를 제거했어요. API가 개발 전이거나 오류가 발생한 상황에도 멈추지 않고 개발할 수 있도록 설계했어요.")
            .font(.body)
            .fontWeight(.regular)
        }
      }
      .columns(2)
      .padding(.top, .medium)
      
      Group {
        Text("아직 하지 못한 얘기가 많아요")
          .font(.title5)
          .fontWeight(.semibold)
          .padding(.top, .xLarge)
          .padding(.bottom, .medium)
        
        Link("구경하기", target: HeatPickPage())
          .linkStyle(.button)
          .buttonSize(.large)
          .role(.primary)
      }
      .horizontalAlignment(.center)
    }
  }
}
