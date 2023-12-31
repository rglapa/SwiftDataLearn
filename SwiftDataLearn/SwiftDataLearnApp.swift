//
//  SwiftDataLearnApp.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataLearnApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        #if os(iOS)
        DocumentGroup(editing:.flashCards, migrationPlan: FlashCardsMigrationPlan.self) {
            ContentView()
        }
        #else
        WindowGroup {
            ContentView().modelContainer(previewContainer)
        }
        #endif
    }
}
