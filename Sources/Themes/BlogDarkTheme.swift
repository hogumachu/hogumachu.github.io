//
//  BlogDarkTheme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 2/6/25.
//

import Ignite

// TODO: - 테마 반영

struct BlogDarkTheme: Theme {
  static var name = "dark"
 
//  var accent: Color { .primaryColor }
//  var secondaryAccent: Color { .secondaryColor }
//  var success: Color { .green }
//  var info: Color { Color(hex: "#0dcaf0") }
//  var warning: Color { Color(hex: "#ffc107") }
//  var danger: Color { Color(hex: "#dc3545") }
//  var light: Color { Color(hex: "#f8f9fa") }
//  var dark: Color { Color(hex: "#212529") }
//  var primary: Color { .textColor }
//  var background: Color { .gray400 }
//  var emphasis: Color { Color(hex: "#ffffff") }
//  var secondary: Color { .secondaryTextColor }
//  var tertiary: Color { .gray100 }
//  var secondaryBackground: Color { .gray300 }
//  var tertiaryBackground: Color { Color(hex: "#2b3035") }
//  var link: Color { Color(hex: "#6ea8fe") }
//  var linkHover: Color { Color(hex: "#8bb9fe") }
//  var border: Color { Color(hex: "#495057") }
//  var syntaxHighlighterTheme: HighlighterTheme { .xcodeDark }
  
  var accent: Color { .primaryColor }
  var secondaryAccent: Color { .secondaryColor }
  var success: Color { .green }
  var info: Color { Color(hex: "#0dcaf0") }
  var warning: Color { Color(hex: "#ffc107") }
  var danger: Color { Color(hex: "#dc3545") }
  var light: Color { Color(hex: "#f8f9fa") }
  var dark: Color { Color(hex: "#212529") }
  var primary: Color { .textColor }
  var emphasis: Color { .primaryColor }
  var secondary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.75) }
  var tertiary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.5) }
  var background: Color { Color(hex: "#ffffff") }
  var secondaryBackground: Color { Color(hex: "#e9ecef") }
  var tertiaryBackground: Color { Color(hex: "#f8f9fa") }
  var border: Color { Color(hex: "#dee2e6") }
  var heading: Color { .default }
  var syntaxHighlighterTheme: HighlighterTheme { .automatic }

  // Links
  var link: Color { Color(hex: "#0d6efd") }
  var linkHover: Color { Color(hex: "#0a58ca") }
  var linkDecoration: TextDecoration { .underline }

  // Font Families
  var sansSerifFont: Font { .default }
  var monospaceFont: Font { .default }
  var font: Font { .default }
  var codeFont: Font { .default }
  var alternateFonts: [Font] { [] }

  // Font Sizes
  var rootFontSize: LengthUnit { .default }
  var bodySize: LengthUnit { .default }
  var smallBodySize: LengthUnit { .default }
  var largeBodySize: LengthUnit { .default }

  // Font Weights
  var lighterFontWeight: LengthUnit { .default }
  var lightFontWeight: LengthUnit { .default }
  var regularFontWeight: LengthUnit { .default }
  var boldFontWeight: LengthUnit { .default }
  var bolderFontWeight: LengthUnit { .default }

  // Line Heights
  var regularLineHeight: LengthUnit { .default }
  var condensedLineHeight: LengthUnit { .default }
  var expandedLineHeight: LengthUnit { .default }

  // Heading Sizes
  var xxLargeHeadingSize: LengthUnit { .default }
  var xLargeHeadingSize: LengthUnit { .default }
  var largeHeadingSize: LengthUnit { .default }
  var mediumHeadingSize: LengthUnit { .default }
  var smallHeadingSize: LengthUnit { .default }
  var xSmallHeadingSize: LengthUnit { .default }

  // Heading Properties
  var headingFont: Font { .default }
  var headingFontWeight: LengthUnit { .default }
  var headingLineHeight: LengthUnit { .default }

  // Bottom Margins
  var headingBottomMargin: LengthUnit { .default }
  var paragraphBottomMargin: LengthUnit { .default }

  // Breakpoints
  var xSmallBreakpoint: LengthUnit { .px(576) }
  var smallBreakpoint: LengthUnit { .px(576) }
  var mediumBreakpoint: LengthUnit { .px(768) }
  var largeBreakpoint: LengthUnit { .px(992) }
  var xLargeBreakpoint: LengthUnit { .px(1200) }
  var xxLargeBreakpoint: LengthUnit { .px(1400) }

  // Maximum widths
  var smallMaxWidth: LengthUnit { .default }
  var mediumMaxWidth: LengthUnit { .default }
  var largeMaxWidth: LengthUnit { .default }
  var xLargeMaxWidth: LengthUnit { .default }
  var xxLargeMaxWidth: LengthUnit { .default }
  
}

extension LengthUnit {
  static var `default` = Self.em(.infinity)
}
