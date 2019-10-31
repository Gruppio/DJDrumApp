//
//  MidiNote+Pad.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

extension MidiNote {
    func color(pad: Int, octave: Int) -> Color {
        let offset = 12 * octave
        
        if note == offset + pad {
            return .blue
        }
        return .gray
    }
}
