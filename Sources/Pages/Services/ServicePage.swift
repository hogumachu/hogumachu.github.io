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
  
  var body: some HTML {
    PageHeader(
      title: "서비스",
      subtitle: "제가 참여한 여러 제품에 대해 소개해요."
    )
    .padding(.top, .xLarge)
    .padding(.bottom, .xLarge)
    
    SectionHeader(
      category: "프로젝트",
      title: "개인 또는 팀으로 진행했던 프로젝트에요",
      subtitle: "어떤 고민이 있었고 어떻게 이를 해결했는지를 공유해요."
    )
    .padding(.top, .xLarge)
    .padding(.bottom, .xLarge)
    
    ServiceComponent(model: .heatpick)
      .padding(.top, .xLarge)
      .padding(.bottom, .xLarge)
  }
}
