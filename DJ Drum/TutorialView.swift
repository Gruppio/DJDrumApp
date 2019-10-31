//
//  DrumPadView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    let track: MidiNoteTrack
    @State var octave = 5
    @State var noteIndex = 0
    
    var note: MidiNote {
        guard noteIndex >= 0 else { return track.first! }
        guard noteIndex < track.count else { return track.last! }
        return track[noteIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    PadView(pad: 0, octave: octave, note: note)
                    PadView(pad: 1, octave: octave, note: note)
                    PadView(pad: 2, octave: octave, note: note)
                    PadView(pad: 3, octave: octave, note: note)
                    PadView(pad: 4, octave: octave, note: note)
                    PadView(pad: 5, octave: octave, note: note)
                }.padding()
                
                HStack {
                    PadView(pad: 6, octave: octave, note: note)
                    PadView(pad: 7, octave: octave, note: note)
                    PadView(pad: 8, octave: octave, note: note)
                    PadView(pad: 9, octave: octave, note: note)
                    PadView(pad: 10, octave: octave, note: note)
                    PadView(pad: 11, octave: octave, note: note)
                }.padding()
                
                HStack {
                    PadView(pad: 12, octave: octave, note: note)
                    PadView(pad: 13, octave: octave, note: note)
                    PadView(pad: 14, octave: octave, note: note)
                    PadView(pad: 15, octave: octave, note: note)
                    PadView(pad: 16, octave: octave, note: note)
                    PadView(pad: 17, octave: octave, note: note)
                }.padding()
            }
            .padding()
        }
    }
}

struct DrumPadView_Previews: PreviewProvider {
    static var track: MidiNoteTrack {
        let midiData = MidiData()
        midiData.load(data: Song.secrets.data)
        return midiData.noteTracks.first!
    }
    
    static var previews: some View {
        TutorialView(track: track)
    }
}
