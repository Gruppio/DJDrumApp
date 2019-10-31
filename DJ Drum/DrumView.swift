//
//  DrumView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct DrumView: View {
    let drumState: DrumState
    
    var body: some View {
        VStack {
            HStack {
                PadView(isActive: drumState.isActive(pad: 0))
                PadView(isActive: drumState.isActive(pad: 1))
                PadView(isActive: drumState.isActive(pad: 2))
                PadView(isActive: drumState.isActive(pad: 3))
                PadView(isActive: drumState.isActive(pad: 4))
                PadView(isActive: drumState.isActive(pad: 5))
            }.padding()
            
            HStack {
                PadView(isActive: drumState.isActive(pad: 6))
                PadView(isActive: drumState.isActive(pad: 7))
                PadView(isActive: drumState.isActive(pad: 8))
                PadView(isActive: drumState.isActive(pad: 9))
                PadView(isActive: drumState.isActive(pad: 10))
                PadView(isActive: drumState.isActive(pad: 11))
            }.padding()
            
            HStack {
                PadView(isActive: drumState.isActive(pad: 12))
                PadView(isActive: drumState.isActive(pad: 13))
                PadView(isActive: drumState.isActive(pad: 14))
                PadView(isActive: drumState.isActive(pad: 15))
                PadView(isActive: drumState.isActive(pad: 16))
                PadView(isActive: drumState.isActive(pad: 17))
            }.padding()
        }
    }
}

struct DrumView_Previews: PreviewProvider {
    static var previews: some View {
        DrumView(drumState: DrumState(activeNotesIndex: [0, 1, 3, 4, 2]))
    }
}
