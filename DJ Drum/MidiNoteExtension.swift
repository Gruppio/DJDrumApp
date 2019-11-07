//
//  MidiNoteExtension.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation
import AudioToolbox

extension MidiNote {
    var octave: Int {
        if [21, 22, 23].contains(note) { return -2 }
        return Int(floor((Float(note) - 24) / 12)) + 1
    }
    
    var midiNoteMessage: MIDINoteMessage {
        MIDINoteMessage(channel: channel,
                        note: note,
                        velocity: velocity,
                        releaseVelocity: releaseVelocity,
                        duration: duration)
    }
}

extension MidiNoteTrack {
    var title: String {
        trackName.isEmpty ? String(count) : trackName
    }
}
