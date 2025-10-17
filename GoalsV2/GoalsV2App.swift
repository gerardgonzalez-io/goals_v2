//
//  GoalsV2App.swift
//  GoalsV2
//
//  Created by Adolfo Gerard Montilla Gonzalez on 12-10-25.
//

import SwiftUI
import SwiftData

@main
struct GoalsV2App: App
{
    // Persisted flag that survives app relaunches; cleared only when app is deleted
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false

    var sharedModelContainer: ModelContainer =
    {
        let schema = Schema([
            Goal.self,
            Topic.self,
            StudySession.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do
        {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        }
        catch
        {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene
    {
        // WindosGroup vs Group, study the differences.
        WindowGroup
        {
            if hasCompletedOnboarding
            {
                ContentView()
            }
            else
            {
                OnboardingView
                {
                    hasCompletedOnboarding = true
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
