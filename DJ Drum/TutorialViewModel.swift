//
//  TutorialViewModel.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class TutorialViewModel: ObservableObject {
    private let numberOfPads = 18
    private static let timeInterval: Float64 = 0.2
    let track: MidiNoteTrack
    let player: MidiNotesPlayer
    @Published var timeStamp: Float64 = 0
    @Published var octave: Int = 4
    @Published var isPlaying = false
    @Published var slowFactor: Int = 1 {
        didSet {
            player.set(speed: 1.0 / Float64(slowFactor))
        }
    }
    private var iterationCount = 1
    var timerSubscription: AnyCancellable?
    var cancellableTimerPublisher: Cancellable?
    let timerPublisher = Timer.publish(every: timeInterval, on: RunLoop.main, in: .default)
    
    var base: Int {
        (octave + 1) * 12
    }
    
    var duration: Float64 {
        guard let lastNote = track.last else { return 0 }
        return lastNote.timeStamp + Double(lastNote.duration)
    }
    
    var timeStampDescription: String {
        String(format: "%.1f", Double(timeStamp))
    }
    
    var currentNotes: [MidiNote] {
        track.notes(from: timeStamp, to: timeStamp + TutorialViewModel.timeInterval)
    }
    
    var allOctaves: [Int] {
        uniqueOctaves(for: track.notes)
    }
    
    var currentOctaves: [Int] {
        uniqueOctaves(for: currentNotes)
    }
    
    var currentOctavesDescription: String {
        currentOctaves
            .map { String($0) }
            .joined(separator: ",")
            .appending(" ")
    }
    
    var currentOctaveDescriptionColor: Color {
        guard currentOctaves.count < 2 else { return .red }
        
        if currentOctaves.count == 1 && currentOctaves.first! == octave {
            return .green
        }
        
        return .orange
    }
    
    var allOctavesDescription: String {
        allOctaves.map { String($0) }.joined(separator: ",")
    }
    
    init(track: MidiNoteTrack) {
        self.track = track
        self.player = MidiNotesPlayer(midiNotes: track.notes)
        
        timerSubscription = timerPublisher
            .sink { [weak self] receivedTimeStamp in
                guard let self = self else { return }
                guard self.isPlaying else { return }
                self.iterationCount += 1
                guard self.iterationCount % self.slowFactor == 0 else { return }
                self.timeStamp += TutorialViewModel.timeInterval
        }
        cancellableTimerPublisher = timerPublisher.connect()
        octave = allOctaves.first ?? 4
        player.set(speed: 0.5)
        if isPlaying {
            play()
        }
    }
    
    func uniqueOctaves(for notes: [MidiNote]) -> [Int] {
        Array(Set(notes.map { $0.octave })).sorted()
    }
    
    func play() {
        isPlaying = true
        player.play()
    }
    
    func pause() {
        isPlaying = false
        player.pause()
    }
    
    func increaseSlowFactor() {
        slowFactor += 1
    }
    
    func decreaseSlowFactor() {
        guard slowFactor > 1 else { return }
        slowFactor -= 1
    }
    
    func increaseOctave() {
        guard octave < 8 else { return }
        octave += 1
    }
    
    func decreaseOctave() {
        guard octave >= -2 else { return }
        octave -= 1
    }
    
    func reset() {
        timeStamp = 0
        player.reset()
    }
    
    func getDrumState() -> DrumState {
        let displayableNotes = currentNotes
            .map { Int($0.note) - base }
            .filter { $0 >= 0 && $0 < numberOfPads }
//        print(currentNotes.map { Int($0.note) }.map { String($0) }.joined(separator: ","))
//        print(displayableNotes.map { String($0) }.joined(separator: ","))
 //       print("---")
        return DrumState(activeNotesIndex: Array(displayableNotes))
    }
}
