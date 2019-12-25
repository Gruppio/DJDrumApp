//
//  MusicPlayer.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 01/11/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

import AudioToolbox

/*
 var sequence : MusicSequence? = nil
 var musicSequence = NewMusicSequence(&sequence)
 
 var track : MusicTrack? = nil
 var musicTrack = MusicSequenceNewTrack(sequence!, &track)
 
 // Adding notes
 
 var time = MusicTimeStamp(1.0)
 for index:UInt8 in 60...72 { // C4 to C5
 var note = MIDINoteMessage(channel: 0,
 note: index,
 velocity: 64,
 releaseVelocity: 0,
 duration: 1.0 )
 musicTrack = MusicTrackNewMIDINoteEvent(track!, time, &note)
 time += 1
 }
 
 // Creating a player
 
 var musicPlayer : MusicPlayer? = nil
 var player = NewMusicPlayer(&musicPlayer)
 
 player = MusicPlayerSetSequence(musicPlayer!, sequence)
 player = MusicPlayerStart(musicPlayer!)
 */

class MidiNotesPlayer {
  let midiNotes: [MidiNote]
  var sequence: MusicSequence!
  var track: MusicTrack!
  var musicPlayer: MusicPlayer!
  
  init(midiNotes: [MidiNote]) {
    self.midiNotes = midiNotes
    NewMusicSequence(&sequence)
    MusicSequenceNewTrack(sequence, &track)
    NewMusicPlayer(&musicPlayer)
    midiNotes.forEach { note in
      var midiNoteMessage = note.midiNoteMessage
      MusicTrackNewMIDINoteEvent(track, note.timeStamp, &midiNoteMessage)
    }
    MusicPlayerSetSequence(musicPlayer, sequence)
  }
  
  func set(speed: Float64) {
    MusicPlayerSetPlayRateScalar(musicPlayer, speed)
  }
  
  func play() {
    MusicPlayerStart(musicPlayer)
  }
  
  func pause() {
    MusicPlayerStop(musicPlayer)
  }
  
  func set(timeStamp: MusicTimeStamp) {
    MusicPlayerSetTime(musicPlayer, timeStamp)
  }
  
  func reset() {
    set(timeStamp: 0)
  }
}
