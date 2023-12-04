//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Quest76 on 01.12.2023.
//

import SwiftUI

struct MapAnnotationView: View {
  var location: NationalParkLocation
  
  @State private var animation: Double = 0.0

  var body: some View {
    ZStack {
      Circle()
        .fill(.accent)
        .frame(width: 54, height: 54, alignment: .center)
      Circle()
        .stroke(.accent, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + CGFloat(animation) / 2)
        .opacity(1 - animation)
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
      .clipShape(Circle())
    }
    .onAppear {
      withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        animation = 1
      }
    }
  }
}

struct MapAnnotationsView_Previews: PreviewProvider {
  static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .padding()
  }
}
