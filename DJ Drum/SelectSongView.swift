//
//  SelectSongView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct SelectSongView: View {
    let songProvider = SongProvider()
    var body: some View {
        NavigationView {
            List(songProvider.allSongs, id: \.absoluteString) { song in
                NavigationLink(destination: SelectTrackView(url: song)) {
                    Text(self.songProvider.getTitle(for: song))
                }
            }.navigationBarTitle(Text("Select Song"))
        }
    }
}

struct SelectSongView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSongView()
    }
}
