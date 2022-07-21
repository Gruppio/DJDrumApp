//
//  MusicSheetIntonationView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 24/05/2020.
//  Copyright © 2020 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct MusicSheetIntonationView: View {
  @ObservedObject var viewModel: MusicSheetViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      Text("Intonation").font(.headline)
      HStack {
        Button(action: viewModel.decreaseIntonation) {
          Image(systemName: "minus.circle")
        }
        Text("\(viewModel.intonationDescription)")
        Button(action: viewModel.increaseIntonation) {
          Image(systemName: "plus.circle")
        }
      }.font(.largeTitle)
    }
  }
}

struct MusicSheetIntonationView_Previews: PreviewProvider {
  static var track: MidiNoteTrack {
    let midiData = MidiData()
    midiData.load(data: TestSong.calling.data)
    return midiData.noteTracks.first!
  }
  
  static var previews: some View {
    MusicSheetIntonationView(viewModel: MusicSheetViewModel(track: track))
  }
}
