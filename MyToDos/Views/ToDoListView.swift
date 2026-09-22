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

struct ToDoListView: View {
    let items: [ToDoItem]
    let onToggle: (ToDoItem) -> Void
    let onDelete: (IndexSet) -> Void
    
    var body: some View {
        List {
            if items.isEmpty {
                ContentUnavailableView(
                    "No ToDos",
                    systemImage: "checklist",
                    description: Text("Add your first ToDo above.")
                )
                .listRowBackground(Color.clear)
            } else {
                ForEach(items) { item in
                    ToDoRow(
                        title: item.title,
                        isCompleted: item.isCompleted,
                        onToggle: { onToggle(item) }
                    )
                }
                .onDelete(perform: onDelete)
            }
        }
        .listStyle(.plain)
    }
}