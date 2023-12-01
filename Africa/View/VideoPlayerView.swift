//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Quest76 on 01.12.2023.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
  var videoSelected: String
  var videoTitle: String

  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//        Text(videoTitle)
//          .font(.largeTitle)
      }
//      .overlay(
//        Image("logo")
//          .resizable()
//          .scaledToFit()
//          .frame(width: 32, height: 32)
//          .padding(.top, 6)
//          .padding(.horizontal, 8),
//        alignment: .topLeading
//      )
    }
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  }
}

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}
