//
//  WebStie.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

struct WebStie: Site {
  let name = "hogumachu tech"
  let titleSuffix = " - hogumachu tech"
  let url = URL(string: "https://hogumachu.github.io")!
  let language: Language = .korean
  let builtInIconsEnabled: BootstrapOptions = .localBootstrap
  let author = "Hogumachu"
  var homePage = HomePage()
  var layout = MainLayout()
  var lightTheme: (any Theme)? = DarkTheme()
  var darkTheme: (any Theme)? = DarkTheme()
  let staticPages: [any StaticPage] = [
    BlogPage(),
    ServicePage(),
    HeatPickPage()
  ]
  let articlePages: [any ArticlePage] = [
    BlogContentLayout()
  ]
  let syntaxHighlighterConfiguration: SyntaxHighlighterConfiguration = .init(languages: [.swift])
}
