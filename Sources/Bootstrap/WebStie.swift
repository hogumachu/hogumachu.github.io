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
  let homePage = HomePage()
  let theme: some Theme = MainTheme()
  let pages: [any StaticPage] = [
    BlogPage(),
    ServicePage(),
    CareerPage(),
    HeatPickPage()
  ]
  let layouts: [any ContentPage] = [
    BlogContentLayout()
  ]
  let syntaxHighlighters: [SyntaxHighlighter] = [.swift]
}
