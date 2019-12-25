//
//  MainView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 25/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      TabView {
        SelectSongView()
          .tabItem {
            Image(systemName: "list.dash")
            Text("Tutorial")
        }
      }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
