//
//  PlayingViewModel.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 26/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PlayingViewModel: ObservableObject {
  let player = PianoPlayer()
  @Published var activePads: [Int] = []
  @Published var octave = 4
  @Published var intonation = true
  @Published var intonationOffset = 0
  
  var padMapping: PadMapping {
    intonation ? IntonationPadMapping() : NormalPadMapping()
  }
  
  var intonationDescription: String {
    Note.Name(rawValue: intonationOffset)?.description ?? "?"
  }
  
  var drumState: DrumState {
    DrumState(activePads: activePads)
  }

  var base: Int {
    (octave + 1) * 12
  }
  
  var intonationOffsetValue: Int {
    intonation ? intonationOffset : 0
  }
    
  func increaseOctave() {
    guard octave < 8 else { return }
    octave += 1
  }
  
  func decreaseOctave() {
    guard octave >= -2 else { return }
    octave -= 1
  }
  
  func increaseIntonation() {
    guard intonationOffset < 12 else { return }
    intonationOffset += 1
  }
  
  func decreaseIntonation() {
    guard intonationOffset >= 0 else { return }
    intonationOffset -= 1
  }
  
  func note(for pad: Int) -> Note {
    let noteNumber = base + padMapping.mapping[pad] + intonationOffsetValue
    return Note(UInt8(noteNumber))
  }
  
  func didTap(pad: Int) {
    guard !activePads.contains(pad) else { return }
    activePads.append(pad)
    player.play(notes: [note(for: pad)])
  }
  
  func didRelease(pad: Int) {
    activePads.removeAll { $0 == pad }
    player.pause(note: note(for: pad))
  }
}
