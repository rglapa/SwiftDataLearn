//
//  PreviewSampleData.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Card.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Card>()).isEmpty {
            SampleDeck.contents.forEach { container.mainContext.insert($0)}
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
