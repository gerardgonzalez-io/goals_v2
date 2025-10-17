//
//  Topic.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import Foundation
import SwiftData

@Model
class Topic: Identifiable
{
    var id: UUID
    var name: String
    // Estudia para que es util esta propiedad studySessions
    // tanto tecnicamente como dentro del flujo funcional de la App
    var studySessions: [StudySession]?

    init(name: String, studySessions: [StudySession]? = nil)
    {
        self.id = UUID()
        self.name = name
        self.studySessions = studySessions
    }
}

extension Topic
{
    static let sampleData = [
        Topic(name: "iOS"),
        Topic(name: "Swift"),
        Topic(name: "Electronic"),
        Topic(name: "Japanese"),
        Topic(name: "SwiftUI"),
        Topic(name: "C languange"),
    ]
}
