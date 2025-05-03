//
//  Theme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 5/3/25.
//

import Ignite

private protocol BaseTheme: Theme {}

extension BaseTheme {
  var siteWidth: ResponsiveValues { .init(medium: .px(1000)) }
  var breakpoints: ResponsiveValues { .init(medium: .px(1000)) }
  
  var lineSpacing: LengthUnit { .em(1.5) }
  var paragraphBottomMargin: LengthUnit { .em(1.5) }
  
  var rootFontSize: LengthUnit { .em(1.0) }
  var codeBlockFontSize: LengthUnit { .em(1.0) }
  var font: Font { .pretendard }
  
  var accent: Color { .init(hex: "#DBD266") }
}

struct DarkTheme: BaseTheme {
  var colorScheme: ColorScheme = .dark
  
  var primary: Color = .textColor
  var emphasis: Color = .textColor
  var secondary: Color = .textColor
  var tertiary: Color = .textColor
  var offWhite: Color = .textColor
  var offBlack: Color = .background
  var background: Color = .background
  var secondaryBackground: Color = .secondaryBackground
  var tertiaryBackground: Color = .tertiaryBackground
}

extension Color {
  static let background: Color = .init(hex: "#282828")
  static let secondaryBackground: Color = .init(hex: "#2C2C2C")
  static let tertiaryBackground: Color = .init(hex: "#2F2F2F")
  static let lightBackground: Color = .init(hex: "#FCF3DF")
  
  static let textColor: Color = .init(hex: "#FCF3DF")
  static let lightTextColor: Color = .init(hex: "#282828")
}

private extension Font {
  static let pretendard = Font(
    name: "Pretendard",
    sources: [
      .init(weight: .ultraLight, url: URL(static: "/fonts/pretendard/Pretendard-ExtraLight.woff2")),
      .init(weight: .thin, url: URL(static: "/fonts/pretendard/Pretendard-Thin.woff2")),
      .init(weight: .light, url: URL(static: "/fonts/pretendard/Pretendard-Light.woff2")),
      .init(weight: .regular, url: URL(static: "/fonts/pretendard/Pretendard-Regular.woff2")),
      .init(weight: .medium, url: URL(static: "/fonts/pretendard/Pretendard-Medium.woff2")),
      .init(weight: .semibold, url: URL(static: "/fonts/pretendard/Pretendard-SemiBold.woff2")),
      .init(weight: .bold, url: URL(static: "/fonts/pretendard/Pretendard-Bold.woff2")),
      .init(weight: .heavy, url: URL(static: "/fonts/pretendard/Pretendard-ExtraBold.woff2")),
      .init(weight: .black, url: URL(static: "/fonts/pretendard/Pretendard-Black.woff2")),
    ]
  )
}
