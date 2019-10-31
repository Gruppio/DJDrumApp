//
//  TutorialViewModel.swift
//  DJ Drum
//
//  Created by Michele Gruppioni on 31/10/2019.
//  Copyright © 2019 Michele Gruppioni. All rights reserved.
//

import Foundation
import Combine

class TutorialViewModel: ObservableObject {
    private let numberOfPads = 18
    private static let timeInterval: Float64 = 0.2
    let track: MidiNoteTrack
    @Published var timeStamp: Float64 = 0
    @Published var octave: Int = 4
    @Published var isPlaying = true
    var timerSubscription: AnyCancellable?
    var cancellableTimerPublisher: Cancellable?
    let timerPublisher = Timer.publish(every: timeInterval, on: RunLoop.main, in: .default)
    
    var base: Int {
        (octave + 2) * 12
    }
    
    var duration: Float64 {
        guard let lastNote = track.last else { return 0 }
        return lastNote.timeStamp + Double(lastNote.duration)
    }
    
    var currentNotes: [MidiNote] {
        track.notes(from: timeStamp, to: timeStamp + TutorialViewModel.timeInterval)
    }
    
    var allOctaves: [Int] {
        uniqueOctaves(for: track.notes)
    }
    
    var currentOctavesDescription: String {
        uniqueOctaves(for: currentNotes).map { String($0) }.joined(separator: ",")
    }
    
    var allOctavesDescription: String {
        allOctaves.map { String($0) }.joined(separator: ",")
    }
    
    init(track: MidiNoteTrack) {
        self.track = track
        timerSubscription = timerPublisher
            .sink { [weak self] receivedTimeStamp in
                guard let self = self else { return }
                guard self.isPlaying else { return }
                self.timeStamp += TutorialViewModel.timeInterval
        }
        cancellableTimerPublisher = timerPublisher.connect()
        octave = allOctaves.first ?? 4
        play()
    }
    
    func uniqueOctaves(for notes: [MidiNote]) -> [Int] {
        Array(Set(notes.map { $0.octave })).sorted()
    }
    
    func play() {
        isPlaying = true
    }
    
    func pause() {
        isPlaying = false
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
    }
    
    func getDrumState() -> DrumState {
        let displayableNotes = currentNotes
            .map { Int($0.note) - base }
            .filter { $0 >= 0 && $0 < numberOfPads }
        
        return DrumState(activeNotesIndex: Array(displayableNotes))
    }
}
