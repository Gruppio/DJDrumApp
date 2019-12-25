//
//  Song.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

enum TestSong: String, CaseIterable, Identifiable {
  case amorTojours, belong, calling, lonleyTogether, moreThanYouKnow, secrets, years
  
  var data: Data {
    switch self {
    case .amorTojours: return try! Data(contentsOf: R.file.amour_tojoursMid()!)
    case .belong: return try! Data(contentsOf: R.file.belongMid()!)
    case .calling: return try! Data(contentsOf: R.file.callingMid()!)
    case .lonleyTogether: return try! Data(contentsOf: R.file.lonely_togetherMid()!)
    case .moreThanYouKnow: return try! Data(contentsOf: R.file.more_than_you_knowMid()!)
    case .secrets: return try! Data(contentsOf: R.file.secretsMid()!)
    case .years: return try! Data(contentsOf: R.file.yearsMid()!)
    }
  }
  
  var title: String {
    rawValue
  }
  
  var id: String {
    rawValue
  }
}
