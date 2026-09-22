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

@MainActor
@Observable
final class ToDoStore {
    private(set) var items: [ToDoItem] = []
    
    private let fileURL: URL
    
    init(fileManager: FileManager = .default) {
        let documentsDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first ?? fileManager.temporaryDirectory
        
        fileURL = documentsDirectory.appending(
            path: "todos.json",
            directoryHint: .notDirectory
        )
        load()
    }
    
    func add(title: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        items.append(ToDoItem(title: trimmedTitle))
        save()
    }
    
    func toggleCompletion(for item: ToDoItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        
        items[index].isCompleted.toggle()
        save()
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }
    
    private func load() {
        guard let data = try? Data(contentsOf: fileURL),
              let savedItems = try? JSONDecoder().decode([ToDoItem].self, from: data) else {
            return
        }
        
        items = savedItems
    }
    
    private func save() {
        guard let data = try? JSONEncoder().encode(items) else {
            return
        }
        
        try? data.write(to: fileURL, options: .atomic)
    }
}