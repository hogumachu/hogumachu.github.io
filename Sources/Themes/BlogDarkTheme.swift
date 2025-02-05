//
//  BlogDarkTheme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 2/6/25.
//

import Ignite

// TODO: - 테마 반영

struct BlogDarkTheme: Theme {
  static var name = "blog-dark-theme"
 
  var accent: Color { .primaryColor }
  var secondaryAccent: Color { .secondaryColor }
  var success: Color { .green }
  var info: Color { Color(hex: "#0dcaf0") }
  var warning: Color { Color(hex: "#ffc107") }
  var danger: Color { Color(hex: "#dc3545") }
  var light: Color { Color(hex: "#f8f9fa") }
  var dark: Color { Color(hex: "#212529") }
  var primary: Color { .textColor }
  var background: Color { .gray400 }
  var emphasis: Color { Color(hex: "#ffffff") }
  var secondary: Color { .secondaryTextColor }
  var tertiary: Color { .gray100 }
  var secondaryBackground: Color { .gray300 }
  var tertiaryBackground: Color { Color(hex: "#2b3035") }
  var link: Color { Color(hex: "#6ea8fe") }
  var linkHover: Color { Color(hex: "#8bb9fe") }
  var border: Color { Color(hex: "#495057") }
  var syntaxHighlighterTheme: HighlighterTheme { .xcodeDark }
  
}
