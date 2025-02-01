//
//  Career+Data.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/26/25.
//

import Foundation

extension Career {
  static let ikoob = Career(
    link: .init(name: "아이쿱", url: "https://intro.doctorvice.co.kr"),
    role: "iOS 개발자",
    summary: "환자를 위한 맞춤형 건강관리 앱 닥터바이스 서비스 스타트업",
    skills: ["SwiftUI", "TCA", "Tuist", "Clean Architecture", "XCTest", "SnapshotTesting", "Google Analytics"],
    descriptions: [
      .init(
        title: "신규 서비스 개발",
        components: [
          "SwiftUI와 TCA를 활용하여 신규 서비스인 닥터바이스 앱을 개발했어요.",
          "환자를 위한 문진, 건강 기록 등 기능을 개발했으며, 앱에 필수적인 로그인, FCM 등 여러 기능을 개발했어요.",
        ]
      ),
      .init(
        title: "모듈 구조, 아키텍처 구상 및 개선",
        components: [
          "Clean Architecture를 활용하여 역할에 맞도록 모듈을 분리했어요.",
          "Tuist로 모듈화를 진행하였으며, 데모 앱을 활용하여 빠르게 개발할 수 있는 환경을 구축했어요."
        ]
      ),
      .init(
        title: "테스트 가능한 구조 설계",
        components: [
          "인터페이스를 분리하여 의존성 주입을 통해 테스트 가능하도록 설계했어요.",
          "XCTest 를 활용하여 테스트를 작성했어요.",
          "SnapshotTesting을 활용하여 스냅샷 테스트를 작성하여 UI 변경에 대한 안정성과 빠른 리뷰가 가능하게 했어요."
        ]
      ),
      .init(
        title: "그 외에도",
        components: [
          "기존 작업 단위가 큰 것을 작게 나누어 진행하는 방식으로 개선하였어요. 덕분에 더 빠르게 기능 검증 및 개발이 진행되었다는 피드백을 받았어요.",
          "여러 의사결정에 대해 Architecture Decision Record(ADR)을 작성하여 추후 히스토리를 더 쉽게 파악할 수 있게 노력했어요.",
          "코드 퀄리티를 높이기 위해 적극적인 코드 리뷰를 진행하고 있으며, 온보딩 시 페어 프로그래밍을 진행하여 더 빠르게 적응할 수 있도록 하고 있어요."
        ]
      )
    ],
    start: "2024.05",
    end: "재직 중"
  )
  
  static let orwellHealth = Career(
    link: .init(name: "오웰헬스", url: "https://orwell.distancing.im/about-orwell-health"),
    role: "iOS 개발자",
    summary: "비대면 상담 및 디지털 헬스케어 앱 inside 서비스 스타트업",
    skills: ["UIKit", "SnapKit", "RxSwift", "Fastlane", "GitHub Actions", "Mixpanel", "Google Analytics"],
    descriptions: [
      .init(
        title: "아키텍처 개선",
        components: [
          "RxSwift 및 MVVM 아키텍처 구조로 개선했어요.",
          "Protocol을 활용하여 테스트 가능한 구조로 개선했어요.",
        ]
      ),
      .init(
        title: "생산성 향상",
        components: [
          "GitHub Actions, Fastlane을 활용하여 CI/CD를 구축했어요.",
          "배포 자동화를 통해 5시간 이상(1주일 기준) 시간을 절약했어요."
        ]
      ),
      .init(
        title: "데이터 기반 의사결정",
        components: [
          "대부분의 의사결정을 데이터 기반으로 했어요.",
          "Analytics를 활용하여 10%이상 이탈률을 개선한 경험이 있어요.",
          "가장 설득력 있는 말은 숫자라는 것을 깨달았어요.",
        ]
      ),
      .init(
        title: "애자일 그리고 린에 대한 경험",
        components: [
          "배포 주기를 1주일로 잡아 폭발적인 속도로 제품을 개발했어요.",
          "폭발적인 속도로 제품 개발을 위해 의사결정 속도 또한 빠른 속도로 진행했어요.",
          "가설을 세워 검증하는 실험을 통해 사용자의 끊임없는 피드백을 통해 제품을 빠른 속도로 개선했어요."
        ]
      ),
    ],
    start: "2021.12",
    end: "2022.11"
  )
}
