//
//  CenterModifier.swift
//  Africa
//
//  Created by Quest76 on 04.12.2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
