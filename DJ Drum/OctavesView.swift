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
        VStack(alignment: .leading) {
            HStack {
                Text("All: ").font(.headline)
                Text(viewModel.allOctavesDescription).font(.title)
            }
            HStack {
                Text("Current: ").font(.headline)
                Text(viewModel.currentOctavesDescription).font(.title)
            }
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
        midiData.load(data: Song.secrets.data)
        return midiData.noteTracks.first!
    }
    
    static var previews: some View {
        OctavesView(viewModel: TutorialViewModel(track: track))
    }
}
