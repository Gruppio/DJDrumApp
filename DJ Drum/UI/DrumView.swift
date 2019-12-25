//
//  DrumView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct DrumView: View {
  let drumState: DrumState
  var didTap: ((Int) -> Void)?
  
  var body: some View {
    VStack {
      HStack {
        PadView(isActive: drumState.isActive(pad: 0), didTap: { self.didTap?(0) })
        PadView(isActive: drumState.isActive(pad: 1), didTap: { self.didTap?(1) })
        PadView(isActive: drumState.isActive(pad: 2), didTap: { self.didTap?(2) })
        PadView(isActive: drumState.isActive(pad: 3), didTap: { self.didTap?(3) })
        PadView(isActive: drumState.isActive(pad: 4), didTap: { self.didTap?(4) })
        PadView(isActive: drumState.isActive(pad: 5), didTap: { self.didTap?(5) })
      }.padding()
      
      HStack {
        PadView(isActive: drumState.isActive(pad: 6), didTap: { self.didTap?(6) })
        PadView(isActive: drumState.isActive(pad: 7), didTap: { self.didTap?(7) })
        PadView(isActive: drumState.isActive(pad: 8), didTap: { self.didTap?(8) })
        PadView(isActive: drumState.isActive(pad: 9), didTap: { self.didTap?(9) })
        PadView(isActive: drumState.isActive(pad: 10), didTap: { self.didTap?(10) })
        PadView(isActive: drumState.isActive(pad: 11), didTap: { self.didTap?(11) })
      }.padding()
      
      HStack {
        PadView(isActive: drumState.isActive(pad: 12), didTap: { self.didTap?(12) })
        PadView(isActive: drumState.isActive(pad: 13), didTap: { self.didTap?(13) })
        PadView(isActive: drumState.isActive(pad: 14), didTap: { self.didTap?(14) })
        PadView(isActive: drumState.isActive(pad: 15), didTap: { self.didTap?(15) })
        PadView(isActive: drumState.isActive(pad: 16), didTap: { self.didTap?(16) })
        PadView(isActive: drumState.isActive(pad: 17), didTap: { self.didTap?(17) })
      }.padding()
    }
  }
}

struct DrumView_Previews: PreviewProvider {
  static var previews: some View {
    DrumView(drumState: DrumState(activeNotesIndex: [0, 1, 3, 4, 2]))
  }
}
