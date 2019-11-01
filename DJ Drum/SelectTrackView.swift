//
//  SelectTrackView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct SelectTrackView: View {
    let url: URL
    let midiData: MidiData
    
    init(url: URL) {
        self.url = url
        self.midiData = MidiData()
        if let data = try? Data(contentsOf: url) {
            self.midiData.load(data: data)
        }
    }
    
    var body: some View {
        List(midiData.noteTracks, id: \.trackName) { track in
            NavigationLink(destination: TutorialView(viewModel: TutorialViewModel(track: track))) {
                Text(track.trackName)
            }
        }.navigationBarTitle(Text("Select Track"))
    }
}
