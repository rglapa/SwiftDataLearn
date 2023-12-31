//
//  ContentView.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var cards: [Card]
    @State private var editing = false
    @State private var navigationPath: [Card] = []
    

    var body: some View {
        NavigationStack(path: $navigationPath) {
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
