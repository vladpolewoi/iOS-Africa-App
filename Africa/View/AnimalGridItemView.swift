//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Quest76 on 04.12.2023.
//

import SwiftUI

struct AnimalGridItemView: View {
  let animal: Animal

  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(25)
  }
}

struct AnimalGridItemView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    AnimalGridItemView(animal: animals[1])
      .padding()
  }
}
