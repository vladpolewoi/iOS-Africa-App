//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Quest76 on 01.12.2023.
//

import SwiftUI

struct InsetGalleryView: View {
  let animal: Animal
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
          .cornerRadius(25)
        }
      }
    }
  }
}

struct InsetGalleryView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsetGalleryView(animal: animals[1])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
