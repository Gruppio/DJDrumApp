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
  @Published var octave: Int = 4
  
  var drumState: DrumState {
    DrumState(activePads: activePads)
  }

  var base: UInt8 {
    UInt8((octave + 1) * 12)
  }
    
  func increaseOctave() {
    guard octave < 8 else { return }
    octave += 1
  }
  
  func decreaseOctave() {
    guard octave >= -2 else { return }
    octave -= 1
  }
  
  func didTap(pad: Int) {
    guard !activePads.contains(pad) else { return }
    activePads.append(pad)
    let noteNumber = base + UInt8(pad)
    player.play(notes: [Note(noteNumber)])
  }
  
  func didRelease(pad: Int) {
    if let padIndex = activePads.firstIndex(of: pad) {
      activePads.remove(at: padIndex)
    }
  }
}
