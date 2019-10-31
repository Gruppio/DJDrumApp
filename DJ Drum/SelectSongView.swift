//
//  SelectSongView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct SelectSongView: View {
    var body: some View {
        NavigationView {
            List(Song.allCases) { song in
                NavigationLink(destination: SelectTrackView(song: song)) {
                    Text(song.title)
                }
            }.navigationBarTitle(Text("Select a Song"))
        }
    }
}

struct SelectSongView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSongView()
    }
}
