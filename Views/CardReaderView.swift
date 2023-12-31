//
//  CardReaderView.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftUI

struct CardReaderView: View {
    let color: Color
    let text: String
    var displaysCode: Bool = false
    
    var body: some View {
        CardContainerView {
            Text(text)
                .font(Design.cardViewingFont)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.33)
                .padding()
                .fontDesign(displaysCode ? .monospaced : .default)
        }
        .background(color)
    }
}
