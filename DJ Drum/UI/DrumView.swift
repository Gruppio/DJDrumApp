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
  var onTap: ((Int) -> Void)?
  var onRelease: ((Int) -> Void)?
  
  var body: some View {
    VStack {
      HStack {
        PadView(isActive: drumState.isActive(pad: 0), onTap: { self.onTap?(0) }, onRelease: { self.onRelease?(0)} )
        PadView(isActive: drumState.isActive(pad: 1), onTap: { self.onTap?(1) }, onRelease: { self.onRelease?(1)} )
        PadView(isActive: drumState.isActive(pad: 2), onTap: { self.onTap?(2) }, onRelease: { self.onRelease?(2)} )
        PadView(isActive: drumState.isActive(pad: 3), onTap: { self.onTap?(3) }, onRelease: { self.onRelease?(3)} )
        PadView(isActive: drumState.isActive(pad: 4), onTap: { self.onTap?(4) }, onRelease: { self.onRelease?(4)} )
        PadView(isActive: drumState.isActive(pad: 5), onTap: { self.onTap?(5) }, onRelease: { self.onRelease?(5)} )
      }.padding()
      
      HStack {
        PadView(isActive: drumState.isActive(pad: 6), onTap: { self.onTap?(6) }, onRelease: { self.onRelease?(6)} )
        PadView(isActive: drumState.isActive(pad: 7), onTap: { self.onTap?(7) }, onRelease: { self.onRelease?(7)} )
        PadView(isActive: drumState.isActive(pad: 8), onTap: { self.onTap?(8) }, onRelease: { self.onRelease?(8)} )
        PadView(isActive: drumState.isActive(pad: 9), onTap: { self.onTap?(9) }, onRelease: { self.onRelease?(9)} )
        PadView(isActive: drumState.isActive(pad: 10), onTap: { self.onTap?(10) }, onRelease: { self.onRelease?(10)} )
        PadView(isActive: drumState.isActive(pad: 11), onTap: { self.onTap?(11) }, onRelease: { self.onRelease?(11)} )
      }.padding()
      
      HStack {
        PadView(isActive: drumState.isActive(pad: 12), onTap: { self.onTap?(12) }, onRelease: { self.onRelease?(12)} )
        PadView(isActive: drumState.isActive(pad: 13), onTap: { self.onTap?(13) }, onRelease: { self.onRelease?(13)} )
        PadView(isActive: drumState.isActive(pad: 14), onTap: { self.onTap?(14) }, onRelease: { self.onRelease?(14)} )
        PadView(isActive: drumState.isActive(pad: 15), onTap: { self.onTap?(15) }, onRelease: { self.onRelease?(15)} )
        PadView(isActive: drumState.isActive(pad: 16), onTap: { self.onTap?(16) }, onRelease: { self.onRelease?(16)} )
        PadView(isActive: drumState.isActive(pad: 17), onTap: { self.onTap?(17) }, onRelease: { self.onRelease?(17)} )
      }.padding()
    }
  }
}

struct DrumView_Previews: PreviewProvider {
  static var previews: some View {
    DrumView(drumState: DrumState(activePads: [0, 1, 3, 4, 2]))
  }
}
