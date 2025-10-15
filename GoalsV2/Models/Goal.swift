//
//  Goal.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import Foundation

class Goal
{
    var createdAt: Date
    
    var goalInMinutes: Int

    var goalInSeconds: Int
    {
        goalInMinutes * 60
    }

    var goalInHours: Int
    {
        goalInMinutes / 60
    }

    init(goalInMinutes: Int)
    {
        self.goalInMinutes = goalInMinutes
        self.createdAt = Date()
    }
}
