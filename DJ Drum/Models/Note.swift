//
//  No.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 25/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

struct Note: CustomStringConvertible {
  static let notesRange = 21...108
  static var allNotes: [UInt8: Note] = {
    var notes: [UInt8: Note] = [:]
    notesRange.forEach { note in
      let note8 = UInt8(note)
      notes[note8] = Note(note8)
    }
    return notes
  }()
  
  let note: UInt8
  let name: Name
  let octave: Int
  
  init!(_ note: UInt8) {
    let noteInt = Int(note)
    guard Self.notesRange ~= noteInt else { return nil }
    self.note = note
    self.name = Name(rawValue: noteInt % 12)!
    self.octave = (noteInt / 12) - 1
  }
  
  var description: String {
    "\(name)\(octave)"
  }
}

extension Note {
  enum Name: Int, CustomStringConvertible {
    case C, Cs, D, Ds, E, F, Fs, G, Gs, A, As, B
    
    var description: String {
      switch self {
      case .C: return "C"
      case .Cs: return "Cs"
      case .D: return "D"
      case .Ds: return "Ds"
      case .E: return "E"
      case .F: return "F"
      case .Fs: return "Fs"
      case .G: return "G"
      case .Gs: return "Gs"
      case .A: return "A"
      case .As: return "As"
      case .B: return "B"
      }
    }
  }
}
