//
//  StudySession.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import Foundation
import SwiftData

@Model
class StudySession
{
    var topic: Topic
    var goal: Goal
    var startDate: Date?
    var endDate: Date?

    /// Normalized start of day for this session's startDate using the current calendar and time zone.
    /// Returns Date() if startDate is nil.
    var normalizedDay: Date
    {
        // verifica cuando startDate es nil porque si es nil, si se llega a dar ese caso
        guard let startDate else { return Date() }
        var calendarWithTimeZone = Calendar.current
        calendarWithTimeZone.timeZone = TimeZone.current
        return calendarWithTimeZone.startOfDay(for: startDate)
    }

    var durationInMinutes: Int
    {
        guard let startDate, let endDate else { return 0 }
        let seconds = endDate.timeIntervalSince(startDate)
        if seconds <= 0 { return 0 }
        return Int((seconds / 60))
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
    /// Sample data for previews, tests, or prototyping.
    static let sampleData: [StudySession] = {
        let topics = Topic.sampleData
        let goal = Goal.sampleData.first!
        let now = Date()

        return [
            StudySession(
                topic: topics[2],
                goal: goal,
                startDate: now.addingTimeInterval(-48 * 60 * 60 - 4 * 60),
                endDate:   now.addingTimeInterval(-48 * 60 * 60),
            ),
            StudySession(
                topic: topics[3],
                goal: goal,
                startDate: now.addingTimeInterval(-72 * 60 * 60 - (30 * 60 + 30)),
                endDate:   now.addingTimeInterval(-72 * 60 * 60),
            ),
            StudySession(
                topic: topics[3],
                goal: goal,
                startDate: now.addingTimeInterval(-72 * 60 * 60 - (30 * 60 + 30)),
                endDate:   now.addingTimeInterval(-72 * 60 * 60),
            ),
            StudySession(
                topic: topics[5],
                goal: goal,
                startDate: now.addingTimeInterval(-120 * 60 * 60 - (2 * 60 + 45)),
                endDate:   now.addingTimeInterval(-120 * 60 * 60),
            ),
        ]
    }()
}
