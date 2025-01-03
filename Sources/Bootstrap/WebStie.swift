//
//  WebStie.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 1/2/25.
//

import Foundation
import Ignite

// TODO: - WebSite 설정

struct WebStie: Site {
  let name = "Hogumachu 블로그"
  let titleSuffix = " :: 🦧 iOS & Swift 🍌"
  let url = URL(string: "https://hogumachu.github.io")!
  let language: Language = .korean
  let builtInIconsEnabled: BootstrapOptions = .localBootstrap
  let author = "Hogumachu"
  let homePage = Home()
  let theme: some Theme = MainTheme()
  let pages: [any StaticPage] = []
}
