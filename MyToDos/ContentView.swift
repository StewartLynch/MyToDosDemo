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

struct ContentView: View {
    @State private var store = ToDoStore()
    @State private var newToDoTitle = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                AddToDoView(title: $newToDoTitle, onAdd: addToDo)
                ToDoListView(
                    items: store.items,
                    onToggle: store.toggleCompletion,
                    onDelete: store.delete
                )
            }
            .navigationTitle("ToDos")
        }
    }
    
    private func addToDo() {
        guard !newToDoTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        store.add(title: newToDoTitle)
        newToDoTitle = ""
    }
}

#Preview {
    ContentView()
}
