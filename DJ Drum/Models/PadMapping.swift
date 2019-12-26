//
//  PadMapping.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 27/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

// Keyboard
// B:    | 2 | 4 |   | 7 | 9 | 11 |     | 14 | 16 |
// W:  | 1 | 3 | 5 | 6 | 8 | 10 | 12 | 13 | 15 | 17 | 18 |

// Drum
//   1     2     3     4     5     6
// ( 2 ) ( 4 ) ( 7 ) ( 9 ) ( 11 )( 14 )

//   7     8     9    10     11    12
// ( 1 ) ( 3 ) ( 5 ) ( 6 ) ( 8 ) ( 10 )

//   13    14    15    16    17    18
// ( 12 )( 13 )( 15 )( 17 )( 18 )( 16 )

protocol PadMapping {
  var mapping: [Int] { get }
}

struct NormalPadMapping: PadMapping {
  let mapping = [1, 3, 6, 8, 10, 13, 0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 15]
}

struct IntonationPadMapping: PadMapping {
  let mapping = [1, 3, 6, 8, 10, 13, 0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 15]
}
