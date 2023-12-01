//
//  VideoModel.swift
//  Africa
//
//  Created by Quest76 on 01.12.2023.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computer Prop
  var thumbnail: String {
    "video-\(id)"
  }
}
