//
//  CardGallery.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/3/23.
//

import SwiftUI

struct CardGallery: View {
    var cards: [Card]
    @Binding var editing: Bool
    let selectCard: (Card) -> Void
    let addCard: () -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(Design.galleryGridSize)],
                spacing: 20
            ) {
                if Design.editFeatureEnabled {
                    CardGalleryItem(backgroundStyle: .fill.tertiary, action: addCard) {
                        LabeledContent("Add Card") {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                        .labelsHidden()
                    }
                    .shadow(radius: 2)
                }
                
                ForEach(cards) { card in
                    CardGalleryItem(backgroundStyle: Color.cardFront) {
                        selectCard(card)
                    } label: {
                        Text(card.front)
                    }
                }
            }
        }
        .scrollClipDisabled()
        .navigationDestination(for: Card.self) { [editing] selectedCard in
            CardCarousel(editing: editing, cards: cards, selectedCard: selectedCard)
                .toolbar { EditorToolbar(isEnabled: true, editing: $editing) }
                .onDisappear { $editing.wrappedValue = false }
        }
    }
}
