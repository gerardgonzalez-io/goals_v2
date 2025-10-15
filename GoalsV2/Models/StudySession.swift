//
//  StudySession.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import Foundation

class StudySession
{
    var topic: Topic
    var goal: Goal
    var startDate: Date?
    var endDate: Date?

    /// Normalized start of day for this session's startDate using the current calendar and time zone.
    /// Returns nil if startDate is nil.
    var normalizedDay: Date?
    {
        guard let startDate else { return nil }
        var calendarWithTimeZone = Calendar.current
        calendarWithTimeZone.timeZone = TimeZone.current
        return calendarWithTimeZone.startOfDay(for: startDate)
    }

    var durationInMinutes: Int
    {
        guard let startDate, let endDate else { return 0 }
        let seconds = endDate.timeIntervalSince(startDate)
        if seconds <= 0 { return 0 }
        return Int((seconds / 60).rounded())
    }

    init(topic: Topic, goal: Goal, startDate: Date? = nil, endDate: Date? = nil)
    {
        self.topic = topic
        self.goal = goal
        self.startDate = startDate
        self.endDate = endDate
    }
}

extension StudySession
{
    /*
    /// Utility to normalize any date to the start of day in a specific time zone and calendar.
    static func startOfDay(for date: Date, calendar: Calendar = .current, timeZone: TimeZone = .current) -> Date
    {
        var calendarWithTimeZone = calendar
        calendarWithTimeZone.timeZone = timeZone
        return calendarWithTimeZone.startOfDay(for: date)
    }
    */
}
