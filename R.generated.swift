//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.file` struct is generated, and contains static references to 7 files.
  struct file {
    /// Resource file `Amour_tojours.mid`.
    static let amour_tojoursMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Amour_tojours", pathExtension: "mid")
    /// Resource file `Belong.mid`.
    static let belongMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Belong", pathExtension: "mid")
    /// Resource file `Calling.mid`.
    static let callingMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Calling", pathExtension: "mid")
    /// Resource file `Lonely_together.mid`.
    static let lonely_togetherMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Lonely_together", pathExtension: "mid")
    /// Resource file `More_than_you_know.mid`.
    static let more_than_you_knowMid = Rswift.FileResource(bundle: R.hostingBundle, name: "More_than_you_know", pathExtension: "mid")
    /// Resource file `Secrets.mid`.
    static let secretsMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Secrets", pathExtension: "mid")
    /// Resource file `Years.mid`.
    static let yearsMid = Rswift.FileResource(bundle: R.hostingBundle, name: "Years", pathExtension: "mid")
    
    /// `bundle.url(forResource: "Amour_tojours", withExtension: "mid")`
    static func amour_tojoursMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.amour_tojoursMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Belong", withExtension: "mid")`
    static func belongMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.belongMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Calling", withExtension: "mid")`
    static func callingMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.callingMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Lonely_together", withExtension: "mid")`
    static func lonely_togetherMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.lonely_togetherMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "More_than_you_know", withExtension: "mid")`
    static func more_than_you_knowMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.more_than_you_knowMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Secrets", withExtension: "mid")`
    static func secretsMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.secretsMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Years", withExtension: "mid")`
    static func yearsMid(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.yearsMid
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}