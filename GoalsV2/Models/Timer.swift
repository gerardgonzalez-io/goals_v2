//
//  Timer.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import SwiftUI
import SwiftData

@Observable
final class Timer
{
    private(set) var elapsed: TimeInterval = 0
    private(set) var isRunning = false

    private var startDate: Date?

    var lengthInSeconds: Int
    {
        Int(displayTime(at: Date()))
    }
    var lengthInMinutes: Int
    {
        lengthInSeconds / 60
    }

    func toggle() { isRunning ? pause() : start() }

    func start()
    {
        guard !isRunning else { return }
        startDate = Date()
        isRunning = true
    }

    func pause()
    {
        guard isRunning, let start = startDate else { return }
        elapsed += Date().timeIntervalSince(start)
        startDate = nil
        isRunning = false
    }

    func stop()
    {
        if isRunning { pause() }
        elapsed = 0
    }

    func displayTime(at date: Date) -> TimeInterval
    {
        if isRunning, let startDate = startDate
        {
            return elapsed + date.timeIntervalSince(startDate)
        }
        else
        {
            return elapsed
        }
    }

    func formatted(_ time: TimeInterval) -> String
    {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let centiseconds = Int((time - floor(time)) * 100)
        return String(format: "%02d:%02d,%02d", minutes, seconds, centiseconds)
    }
}

