//
//  SelectTrackView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct SelectTrackView: View {
    let song: Song
    let midiData: MidiData
    
    init(song: Song) {
        self.song = song
        self.midiData = MidiData()
        self.midiData.load(data: song.data)
    }
    
    var body: some View {
        List(midiData.noteTracks, id: \.trackName) { track in
            NavigationLink(destination: TutorialView(viewModel: TutorialViewModel(track: track))) {
                Text(track.trackName)
            }
        }.navigationBarTitle(Text("Select Track"))
    }
}

struct SelectTrackView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTrackView(song: Song.secrets)
    }
}
