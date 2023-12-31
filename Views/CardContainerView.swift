//
//  CardContainerView.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftUI

/// A container for card content
struct CardContainerView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
            content
                .foregroundStyle(Color.cardText)
        }
        .aspectRatio(2, contentMode: .fit)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
