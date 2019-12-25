//
//  PianoPlayer.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 23/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class PianoPlayer {
  let players: [UInt8: AVAudioPlayer]
  
  init() {
    var allPlayers: [UInt8: AVAudioPlayer] = [:]
    
    for noteNumber in Note.allNotes.keys {
      let note = Note.allNotes[noteNumber]!
      let url = URL(fileURLWithPath: Bundle.main.path(forResource: note.description, ofType: "wav")!)
      let audioPlayer = try! AVAudioPlayer(contentsOf: url)
      allPlayers[noteNumber] = audioPlayer
    }
    
    self.players = allPlayers
  }
  
  func play(midiNotes: [MidiNote]) {
    let notes = midiNotes.map { $0.note }
    notes.forEach {
      players[$0]?.play()
    }
  }
}
