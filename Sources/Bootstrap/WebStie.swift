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
  let staticLayouts: [any StaticLayout] = [
    BlogPage(),
    ServicePage(),
    CareerPage(),
    HeatPickPage()
  ]
  let contentLayouts: [any ContentLayout] = [
    BlogContentLayout()
  ]
  let syntaxHighlighters: [HighlighterLanguage] = [.swift]
}
