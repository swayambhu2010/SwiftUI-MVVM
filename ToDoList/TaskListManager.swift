//
//  TaskListManager.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation
import Combine

class TaskListManager: ObservableObject {
    
   @Published var items: [Task] = []
    
    init() {
        self.items = getTaskList()
    }
    
    private func refreshTaskList() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
    }
    
    private func getTaskList() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        guard let json = try? JSONDecoder().decode([Task].self, from: data) else { return [] }
        items = json
        return items
    }
    
    func updateTaskList(task: Task) {
        items.append(task)
        refreshTaskList()
    }
    
    private func deleteTask(task: Task) {
        let index = items.firstIndex(of: task) ?? 0
        items.remove(at: index)
        refreshTaskList()
    }
    
    private func toggleTaskCompletion(task: Task) {
        let index = items.firstIndex(of: task) ?? 0
        items[index].isCompleted.toggle()
        refreshTaskList()
    }
}
