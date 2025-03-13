//
//  CommentScript.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/7/25.
//

import Foundation
import Ignite

extension Script {
  static let comment: some HTML = Script(file: "https://utteranc.es/client.js")
    .attribute("repo", "hogumachu/hogumachu.github.io")
    .attribute("issue-term", "pathname")
    .attribute("theme", "github-dark") // TODO: - Theme에 맞는 색상 입히기
    .attribute("crossorigin", "anonymous")
}
