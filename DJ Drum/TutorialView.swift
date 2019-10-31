//
//  DrumPadView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var viewModel: TutorialViewModel
    
    var body: some View {
        VStack {
            DrumView(drumState: viewModel.getDrumState())
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Current Octaves: " + viewModel.currentOctavesDescription)
                Text("All Octaves: " + viewModel.allOctavesDescription)
                HStack {
                    Button(action: viewModel.decreaseOctave) {
                        Image(systemName: "minus.circle")
                    }
                    Text("\(viewModel.octave)")
                    Button(action: viewModel.increaseOctave) {
                        Image(systemName: "plus.circle")
                    }
                    Spacer()
                    
                    Button(action: viewModel.reset) {
                        Image(systemName: "arrow.counterclockwise.circle")
                    }
                    if viewModel.isPlaying {
                        Button(action: viewModel.pause) {
                            Image(systemName: "pause.circle")
                        }
                    } else {
                        Button(action: viewModel.play) {
                            Image(systemName: "play.circle")
                        }
                    }
                }.font(.largeTitle)
                //Slider(value: $viewModel.timeStamp, from: Float64(0.0), to: Float64(100.0))
                Slider(value: $viewModel.timeStamp, in: Float64(0.0)...viewModel.duration, step: 0.5)
            }.padding()
        }.navigationBarTitle("Tutorial")
    }
}

struct DrumPadView_Previews: PreviewProvider {
    static var track: MidiNoteTrack {
        let midiData = MidiData()
        midiData.load(data: Song.secrets.data)
        return midiData.noteTracks.first!
    }
    
    static var previews: some View {
        TutorialView(viewModel: TutorialViewModel(track: track))
    }
}
