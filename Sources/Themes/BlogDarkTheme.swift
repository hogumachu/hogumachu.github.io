//
//  BlogDarkTheme.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 2/6/25.
//

import Ignite

// TODO: - 테마 반영

struct BlogDarkTheme: Theme {
  let colorScheme: ColorScheme = .dark
  
  var accent: Color { Color(hex: "#7DE894") }
  var secondaryAccent: Color { Color(hex: "#E2F16C") }
  var success: Color { Color(hex: "#568CF7") }
  var info: Color { Color(hex: "#0dcaf0") } // TODO:
  var warning: Color { Color(hex: "#ffc107") } // TODO:
  var danger: Color { Color(hex: "#dc3545") } // TODO:
  var light: Color { Color(hex: "#f8f9fa") } // TODO:
  var dark: Color { Color(hex: "#212529") } // TODO:
  var primary: Color { Color(hex: "#FBFBFB") }
  var emphasis: Color { Color(hex: "#59A469") }
  var secondary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.75) } // TODO:
  var tertiary: Color { Color(red: 33, green: 37, blue: 41, opacity: 0.5) } // TODO:
  var background: Color { Color(hex: "#000000") }
  var secondaryBackground: Color { Color(hex: "#1F1F21") }
  var tertiaryBackground: Color { Color(hex: "#141416") }
  var border: Color { Color(hex: "#1A1A1A") }
//  var heading: Color { .default } // TODO:
  var syntaxHighlighterTheme: HighlighterTheme { .automatic }

  // Links
  var link: Color { Color(hex: "#4772C9") }
  var linkHover: Color { Color(hex: "#568CF7") }
  var linkDecoration: TextDecoration { .underline }

  // Font Families
//  var sansSerifFont: Font { .default }
//  var monospaceFont: Font { .default }
//  var font: Font { .default }
//  var codeFont: Font { .default }
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
//  var headingFont: Font { .default }
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

