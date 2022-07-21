//
//  MusicSheetView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 17/05/2020.
//  Copyright © 2020 Michele Gruppioni. All rights reserved.
//

import SwiftUI
import GridStack

struct MusicSheetView: View {
  @ObservedObject var viewModel: MusicSheetViewModel
  
  var body: some View {
    VStack {
      GridStack(minCellWidth: 100,
                spacing: 12,
                numItems: viewModel.notes.count,
                alignment: .center) { (index, cellWidth) in
                  MusicSheetNoteView(note: self.viewModel.notes[index])
      }
      MusicSheetIntonationView(viewModel: viewModel)
    }
  }
}

struct MusicSheetView_Previews: PreviewProvider {
  static var track: MidiNoteTrack {
    let midiData = MidiData()
    midiData.load(data: TestSong.calling.data)
    return midiData.noteTracks.first!
  }
  
  static var previews: some View {
    MusicSheetView(viewModel: MusicSheetViewModel(track: track))
  }
}
