//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Quest76 on 30.11.2023.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. Locate the JSON file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle")
    }
    
    // 2. Create the property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    // 3. Create the decoder
    let decoder = JSONDecoder()
    
    // 4. Create a property for the decodded data
    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }
    
    // 5. return the ready-to-use data
    return loaded
  }
}
