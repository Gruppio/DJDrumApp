//
//  DrumViewModel.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

struct DrumState {
  let activePads: [Int]

  func isActive(pad: Int) -> Bool {
    return activePads.contains(pad)
  }
}
