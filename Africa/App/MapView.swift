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
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

  var body: some View {
//    Map(position: $cameraPosition)
    Map(position: $cameraPosition) {
      Marker(coordinate: locations[0].location) {
        
      }
      .tint(.accent)
    }
  }
}

#Preview {
  MapView()
}
