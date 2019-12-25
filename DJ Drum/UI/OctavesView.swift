//
//  OctavesView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 01/11/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct OctavesView: View {
  @ObservedObject var viewModel: TutorialViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      Text("Octave").font(.headline)
      HStack {
        Button(action: viewModel.decreaseOctave) {
          Image(systemName: "minus.circle")
        }
        Text("\(viewModel.octave)")
        Button(action: viewModel.increaseOctave) {
          Image(systemName: "plus.circle")
        }
      }.font(.largeTitle)
    }
  }
}

struct OctavesView_Previews: PreviewProvider {
  static var track: MidiNoteTrack {
    let midiData = MidiData()
    midiData.load(data: TestSong.secrets.data)
    return midiData.noteTracks.first!
  }
  
  static var previews: some View {
    OctavesView(viewModel: TutorialViewModel(track: track))
  }
}
