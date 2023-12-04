//
//  MapView.swift
//  Africa
//
//  Created by Quest76 on 30.11.2023.
//

import MapKit
import SwiftUI

struct MapView: View {
  @State private var cameraPosition: MapCameraPosition = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

    return MapCameraPosition.region(mapRegion)
  }()

  @State private var centerLatitude: CLLocationDegrees = 6.600286
  @State private var centerLongitude: CLLocationDegrees = 16.4377599

  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

  var body: some View {
    Map(position: $cameraPosition) {
      ForEach(locations) { item in
        Annotation("", coordinate: item.location) {
          MapAnnotationView(location: item)
        }
      }
    }
    .onMapCameraChange(frequency: .continuous) { mapCameraUpdateContext in
      self.centerLatitude = mapCameraUpdateContext.region.center.latitude
      self.centerLongitude = mapCameraUpdateContext.region.center.longitude
    }
    .overlay(
      HStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)

        VStack(alignment: .leading, spacing: 3) {
          HStack {
            Text("Latitude: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(centerLatitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }

          Divider()

          HStack {
            Text("Longitude: ")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(centerLongitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        Color.black.opacity(0.6).cornerRadius(25)
      )
      .padding(),
      alignment: .top
    )
  }
}

#Preview {
  MapView()
}
