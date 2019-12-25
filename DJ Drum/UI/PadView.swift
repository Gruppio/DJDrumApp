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
  let didTap: (() -> Void)?
  
  var body: some View {
    Circle()
      .aspectRatio(contentMode: .fit)
      .foregroundColor(isActive ? .blue : .gray)
      .onTapGesture {
        self.didTap?()
    }
  }
}

struct PadView_Previews: PreviewProvider {
  static var previews: some View {
    PadView(isActive: true, didTap: nil)
  }
}
