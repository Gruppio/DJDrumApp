//
//  SongFetcher.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 01/11/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation

class SongProvider {
  let allSongs: [URL]
  
  init() {
    allSongs = try! FileManager.default.contentsOfDirectory(at: Bundle.main.bundleURL, includingPropertiesForKeys: nil).filter { $0.pathExtension == "mid" }
  }
  
  func getTitle(for url: URL) -> String {
    return url.deletingPathExtension().lastPathComponent
  }
}
