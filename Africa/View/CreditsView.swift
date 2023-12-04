//
//  CreditsView.swift
//  Africa
//
//  Created by Quest76 on 04.12.2023.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)

      Text("""
        Copyright © Robert Petras
        All right reserved
        Better Apps ♡ Less Code
        """
      )
      .font(.footnote)
      .multilineTextAlignment(.center)
    }
    .padding()
    .opacity(0.4)
  }
}

#Preview {
  CreditsView()
}
