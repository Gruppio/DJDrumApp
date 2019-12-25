//
//  SlowControlView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 01/11/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct SlowControlView: View {
  @ObservedObject var viewModel: TutorialViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      Text("Slow").font(.headline)
      HStack {
        Button(action: viewModel.decreaseSlowFactor) {
          Image(systemName: "minus.circle")
        }
        Text("\(viewModel.slowFactor)")
        Button(action: viewModel.increaseSlowFactor) {
          Image(systemName: "plus.circle")
        }
      }.font(.largeTitle)
    }
  }
}

struct SlowControlView_Previews: PreviewProvider {
  static var track: MidiNoteTrack {
    let midiData = MidiData()
    midiData.load(data: TestSong.secrets.data)
    return midiData.noteTracks.first!
  }
  
  static var previews: some View {
    SlowControlView(viewModel: TutorialViewModel(track: track))
  }
}
