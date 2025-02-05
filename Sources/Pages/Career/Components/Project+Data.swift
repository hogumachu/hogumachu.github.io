//
//  Project+Data.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/31/25.
//

import Foundation

extension Career {
  static let blog = Career(
    link: .init(name: "Blog", url: "https://github.com/hogumachu/hogumachu.github.io"),
    role: "개인 프로젝트",
    summary: "Swift, Ignite를 활용한 블로그",
    skills: ["Swift", "Ignite", "GitHub Actions"],
    descriptions: [
      .init(
        title: "Swift를 활용한 블로그",
        components: [
          "Swift와 Ignite를 활용하여 블로그를 구현했어요.",
          "Swift에 대한 인사이트를 더 얻고 싶어 선택했어요.",
          "GitHub Actions을 활용하여 빌드 자동화를 구현했어요.",
        ]
      )
    ],
    start: "2025.01",
    end: "현재"
  )
  
  static let simpleNote = Career(
    link: .init(name: "SimpleNote", url: "https://github.com/hogumachu/SimpleNote"),
    role: "개인 프로젝트",
    summary: "멀티 플랫폼 투두 리스트",
    skills: ["SwiftUI", "TCA", "SwiftData", "CloudKit"],
    descriptions: [
      .init(
        title: "빠른 속도",
        components: [
          "SwiftUI를 활용하여 MVP로 빠르게 개발한 서비스에요.",
          "7일 만에 개발하여 배포했어요."
        ]
      ),
      .init(
        title: "새로운 기술에 대한 학습",
        components: [
          "TCA와 SwiftData를 활용하여 개발했어요.",
          "CloudKit을 활용하여 애플 플랫폼 연동을 구현했어요."
        ]
      )
    ],
    start: "2024.04",
    end: "2024.04"
  )
  
  @MainActor
  static let heatPick = Career(
    link: .init(name: "HeatPick", url: HeatPickPage().path),
    role: "네이버 커넥트재단 부스트캠프",
    summary: "지도 기반 SNS 서비스",
    skills: ["UIKit", "RIBs", "Tuist", "Clean Architecture"],
    descriptions: [
      .init(
        title: "프로젝트 리딩",
        components: [
          "전체적인 프로젝트 기획을 했어요.",
          "팀 빌딩, 일정 관리 그리고 디자인까지 지속적으로 팀원에게 피드백을 받으며 작업했어요."
        ]
      ),
      .init(
        title: "아키텍처 설계",
        components: [
          "RIBs 및 클린 아키텍처를 활용하여 독립적인 개발 환경을 구성했어요."
        ]
      ),
      .init(
        title: "모듈화",
        components: [
          "Tuist를 활용하여 모듈화 및 데모앱 구조를 설계했어요.",
          "빌드 속도를 25% 개선했어요(20s -> 15s).",
          "물리적으로 기능을 분리하여 더욱 안전하게 코드를 작성할 수 있도록 만들었어요."
        ]
      )
    ],
    start: "2023.11",
    end: "2023.12"
  )
}
