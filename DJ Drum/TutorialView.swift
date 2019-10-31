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
            
            HStack(alignment: .lastTextBaseline) {
                OctavesView(viewModel: viewModel)
                Spacer()
                SlowControlView(viewModel: viewModel)
                Spacer()
                VStack {
                    Button(action: viewModel.reset) {
                        Image(systemName: "arrow.counterclockwise.circle")
                        .font(.largeTitle)
                    }.padding()
                    if viewModel.isPlaying {
                        Button(action: viewModel.pause) {
                            Image(systemName: "pause.circle")
                            .font(.largeTitle)
                        }
                    } else {
                        Button(action: viewModel.play) {
                            Image(systemName: "play.circle")
                            .font(.largeTitle)
                        }
                    }
                }
            }.padding()
            
            Slider(value: $viewModel.timeStamp, in: Float64(0.0)...viewModel.duration, step: 0.5)
            .padding()
            
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
