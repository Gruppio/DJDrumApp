//
//  PadView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct PadView: View {
  let isActive: Bool
  let onTap: (() -> Void)?
  let onRelease: (() -> Void)?
  
  var body: some View {
    Circle()
      .aspectRatio(contentMode: .fit)
      .foregroundColor(isActive ? .blue : .gray)
      .gesture(
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
        .onChanged ({ _ in self.onTap?() })
        .onEnded { _ in self.onRelease?() }
    )
  }
}

struct PadView_Previews: PreviewProvider {
  static var previews: some View {
    PadView(isActive: true, onTap: nil, onRelease: nil)
  }
}
