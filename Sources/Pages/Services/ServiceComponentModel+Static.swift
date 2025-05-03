//
//  ServiceComponentModel+Static.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 3/13/25.
//

import Foundation
import Ignite

extension ServiceComponentModel {
  @MainActor
  static let heatpick = ServiceComponentModel(
    icon: .init(service: .heatPickIcon),
    title: "HeatPick",
    descrption: "위치 기반 SNS 서비스에요. 네이버 부스트캠프 활동을 하며 진행했던 팀 프로젝트에요. 팀 리딩 및 기획 그리고 iOS 개발자의 역할을 했어요.",
    items: [
      .init(
        title: "RIBs 및 클린 아키텍처 활용",
        description: "RIBs 및 클린 아키텍처 활용하여 독립적인 개발 환경 제공했어요. 기능을 최대한 독립적으로 존재할 수 있게 만들었고 테스트 가능한 구조로 만들었어요. 현재 팀에 어울리는 아키텍처에 대해 많은 고민을 했어요."
      ),
      .init(
        title: "Tuist를 활용한 데모앱",
        description: "Tuist를 활용하여 모듈화 및 데모앱 구조를 설계했어요. 빌드 속도를 많이 개선시켰으며 물리적인 기능 분리를 통해 사이드 이펙트를 제거했어요. API가 개발 전이거나 오류가 발생한 상황에도 멈추지 않고 개발할 수 있도록 설계했어요."
      )
    ],
    navigationTitle: "아직 하지 못한 얘기가 많아요",
    target: HeatPickPage()
  )
}
