//
//  CoverImageVIew.swift
//  Africa
//
//  Created by Quest76 on 30.11.2023.
//

import SwiftUI

struct CoverImageView: View {
  // Props
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // Body
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}

// Preview
#Preview {
  CoverImageView()
}
