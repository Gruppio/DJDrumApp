//
//  MusicSheetViewModel.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 17/05/2020.
//  Copyright © 2020 Michele Gruppioni. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MusicSheetViewModel: ObservableObject {
  private let track: MidiNoteTrack
  @Published var intonation: UInt8 = 0
  
  init(track: MidiNoteTrack) {
    self.track = track
  }
  
  var notes: [Note] {
    track.notes.map { Note($0.note + intonation) }
  }
  
  func increaseIntonation() {
    intonation += 1
  }
  
  func decreaseIntonation() {
    intonation -= 1
  }
  
  var intonationDescription: String {
    Note(60 + intonation).description
  }
}
