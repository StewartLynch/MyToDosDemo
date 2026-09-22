//
//----------------------------------------------
// Original project: MyToDos
// by  Stewart Lynch on 2026-09-21
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions. All rights reserved.

import SwiftUI

struct AddToDoView: View {
    @Binding var title: String
    let onAdd: () -> Void
    
    var body: some View {
        HStack {
            TextField("Add a ToDo", text: $title)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
                .onSubmit(onAdd)
            
            Button(action: onAdd) {
                Image(systemName: "plus")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .accessibilityLabel("Add ToDo")
        }
        .padding()
    }
}
