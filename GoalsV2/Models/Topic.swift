//
//  Topic.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import Foundation

class Topic: Identifiable
{
    var id: UUID
    var name: String
    var studySessions: [StudySession]?

    init(name: String, studySessions: [StudySession]? = nil)
    {
        self.id = UUID()
        self.name = name
        self.studySessions = studySessions
    }
}
