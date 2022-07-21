//
//  MusicSheetNoteView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 17/05/2020.
//  Copyright © 2020 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct MusicSheetNoteView: View {
  let note: Note
  
  var body: some View {
    VStack {
      ZStack {
        HStack(spacing: 0) {
          Rectangle()
            .foregroundColor(firstHalfColor)
          
          Rectangle()
            .foregroundColor(secondHalfColor)
        }
        
        Text("\(note.octave)")
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .font(.system(size: 50, weight: .bold))
        
      }
      .frame(width: 100, height: 100)
        .clipShape(Circle())
      
      Text("\(note.name.italian) - \(note.name.description)")
        .foregroundColor(.black)
    }
  }
  
  private var firstHalfColor: Color {
    switch note.name {
    case .C, .Cs: return .init("C")
    case .D, .Ds: return .init("D")
    case .E: return .init("E")
    case .F, .Fs: return .init("F")
    case .G, .Gs: return .init("G")
    case .A, .As: return .init("A")
    case .B: return .init("B")
    }
  }
  
  private var secondHalfColor: Color {
    switch note.name {
    case .C: return .init("C")
    case .D, .Cs: return .init("D")
    case .E, .Ds: return .init("E")
    case .F: return .init("F")
    case .G, .Fs: return .init("G")
    case .A, .Gs: return .init("A")
    case .B, .As: return .init("B")
    }
  }
}

struct MusicSheetNoteView_Previews: PreviewProvider {
  static var previews: some View {
    MusicSheetNoteView(note: Note(54))
  }
}
