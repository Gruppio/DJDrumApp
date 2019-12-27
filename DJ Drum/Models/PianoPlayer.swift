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
  static var players: [String: AVAudioPlayer] = {
    var allPlayers: [String: AVAudioPlayer] = [:]
    
    let samplesURL: [URL] = try! FileManager
      .default
      .contentsOfDirectory(at: Bundle.main.bundleURL, includingPropertiesForKeys: nil)
      .filter { $0.pathExtension == "wav" }
    
    for url in samplesURL {
      let audioPlayer = try? AVAudioPlayer(contentsOf: url)
      let key = url.deletingPathExtension().lastPathComponent
      allPlayers[key] = audioPlayer
    }
    
    return allPlayers
  }()
  
  var previousNotes: [String] = []
  
  func play(notes: [Note]) {
    let notes = notes.map { $0.description }
    let newNotesToPlay = notes.filter { !previousNotes.contains($0) }
    //    let notesToPause = previousNotes.filter { !notes.contains($0) }
    previousNotes = notes
    
    newNotesToPlay
      .forEach {
        Self.players[$0]?.pause()
        Self.players[$0]?.currentTime = 0
        Self.players[$0]?.play()
    }
    
    //    notesToPause
    //      .forEach {
    //        Self.players[$0]?.pause()
    //        Self.players[$0]?.currentTime = 0
    //    }
  }
  func pause(note: Note) {
    let descr = note.description
    previousNotes.removeAll { $0 == descr }
  }
}
