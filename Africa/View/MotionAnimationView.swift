//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Quest76 on 03.12.2023.
//

import SwiftUI

struct MotionAnimationView: View {
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating: Bool = false

  // 1. Random Coordinate
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }

  // 2. Random Size
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 10...300))
  }

  // 3. Random Scale
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }

  // 4. Random Speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.25...1.0)
  }

  // 5. Random Delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { _ in
          Circle()
            .foregroundStyle(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: 200, alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(
              x: randomCoordinate(max: geometry.size.width),
              y: randomCoordinate(max: geometry.size.height)
            )
            .animation(
              .interpolatingSpring(
                stiffness: 0.5, damping: 0.5
              ).repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay()),
              value: isAnimating
            )
            .onAppear {
              isAnimating = true
            }
        }
      }
      .drawingGroup()
    }
  }
}

#Preview {
  MotionAnimationView()
}
