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
    .addCustomAttribute(name: "repo", value: "hogumachu/hogumachu.github.io")
    .addCustomAttribute(name: "issue-term", value: "pathname")
    .addCustomAttribute(name: "theme", value: "github-dark")
    .addCustomAttribute(name: "crossorigin", value: "anonymous")
}
