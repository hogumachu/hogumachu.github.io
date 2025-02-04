//
//  CommentScript.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/7/25.
//

import Foundation
import Ignite

extension Script {
  static let comment = Script(file: "https://utteranc.es/client.js")
    .customAttribute(name: "repo", value: "hogumachu/hogumachu.github.io")
    .customAttribute(name: "issue-term", value: "pathname")
    .customAttribute(name: "theme", value: "github-dark")
    .customAttribute(name: "crossorigin", value: "anonymous")
}
