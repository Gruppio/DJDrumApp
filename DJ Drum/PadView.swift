//
//  PadView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct PadView: View {
    let pad: Int
    let octave: Int
    let note: MidiNote
    
    var body: some View {
        Circle()
        .foregroundColor(note.color(pad: pad, octave: octave))
    }
}

struct PadView_Previews: PreviewProvider {
    static var previews: some View {
        PadView(pad: 0, octave: 5, note: MidiNote(timeStamp: 0, duration: 0, note: 60, velocity: 128, channel: 0))
    }
}
