//
//  ContentView.swift
//  Africa
//
//  Created by Quest76 on 30.11.2023.
//

import SwiftUI

struct ContentView: View {
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count
    
    switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
    }
  }
  
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            }
            
            CreditsView()
              .modifier(CenterModifier())
          }
          .listStyle(.inset)
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
              }
            }
            .padding()
          }
        }
      }
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          HStack(spacing: 16) {
            Button {
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
            }
            
            Button {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            } label: {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundStyle(isGridViewActive ? Color.accentColor : .primary)
            }
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
