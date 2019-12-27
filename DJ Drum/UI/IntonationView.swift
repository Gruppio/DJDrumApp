//
//  IntonationSwitch.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 27/12/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import SwiftUI

struct IntonationView: View {
  @ObservedObject var viewModel: TutorialViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      Text("Intonation").font(.headline)
      HStack {
        Toggle("", isOn: $viewModel.intonation)
          .labelsHidden()
        Button(action: viewModel.decreaseIntonation) {
          Image(systemName: "minus.circle")
        }
        Text("\(viewModel.intonationDescription)")
        Button(action: viewModel.increaseIntonation) {
          Image(systemName: "plus.circle")
        }
      }.font(.largeTitle)
    }
  }
}

struct PlayingIntonationView: View {
  @ObservedObject var viewModel: PlayingViewModel
  
  var body: some View {
    VStack(alignment: .center) {
      Text("Intonation").font(.headline)
      HStack {
        Toggle("", isOn: $viewModel.intonation)
          .labelsHidden()
        Button(action: viewModel.decreaseIntonation) {
          Image(systemName: "minus.circle")
        }
        Text("\(viewModel.intonationDescription)")
        Button(action: viewModel.increaseIntonation) {
          Image(systemName: "plus.circle")
        }
      }.font(.largeTitle)
    }
  }
}

struct IntonationView_Previews: PreviewProvider {
  static var previews: some View {
    PlayingIntonationView(viewModel: PlayingViewModel())
  }
}
