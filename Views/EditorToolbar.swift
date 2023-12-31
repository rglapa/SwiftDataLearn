//
//  EditorToolbar.swift
//  SwiftDataLearn
//
//  Created by Ruben Glapa on 12/2/23.
//

import SwiftUI

struct EditorToolbar: ToolbarContent {
    let isEnabled: Bool
    @Binding var editing: Bool
    
    var body: some ToolbarContent {
        ToolbarItem {
            if Design.editFeatureEnabled {
                Button {
                    editing.toggle()
                } label: {
                    Image(systemName: editing ? "play" : "pencil")
                }
                .disabled(!isEnabled)
            } else {
                EmptyView()
            }
        }
    }
}
