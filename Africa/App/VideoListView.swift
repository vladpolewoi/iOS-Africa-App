//
//  VideoListView.swift
//  Africa
//
//  Created by Quest76 on 30.11.2023.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

  func refreshList() {
    videos.shuffle()
    hapticImpact.impactOccurred()
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination:
            VideoPlayerView(
              videoSelected: item.id,
              videoTitle: item.name)
          ) {
            VideoListItemView(video: item)
          }
        }
      }
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            refreshList()
          } label: {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
      .refreshable {
        refreshList()
      }
    }
  }
}

#Preview {
  VideoListView()
}
