//
//  PlayingView.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 26/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct PlayingView: View {
  @ObservedObject var viewModel: PlayingViewModel
  
  var body: some View {
    VStack {
      DrumView(drumState: viewModel.drumState, onTap: viewModel.didTap, onRelease: viewModel.didRelease)
      Spacer()
    }.navigationBarTitle("Live Play")
  }
}

struct PlayingView_Previews: PreviewProvider {
  static var previews: some View {
    PlayingView(viewModel: PlayingViewModel())
  }
}
