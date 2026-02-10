//
//  TaskDataProvider.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol TaskDataProviderProtocol {
   func getTaskList() -> [Task]
   func updateTaskList(task: Task) -> [Task]
   func toggleTaskCompletion(task: Task) -> [Task]
   func deleteTask(task: Task) -> [Task]
   func getCurrentSelecteDateTasks(of date: Date) -> [Task]
}

class TaskDataProvider {
    private var taskList: [Task] = []
    
    init() {
        self.taskList = getTaskListFromUserDefaults()
    }
    
    private func getTaskListFromUserDefaults() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        guard let json = try? JSONDecoder().decode([Task].self, from: data) else { return [] }
        return json
    }
    
    private func saveUpdatedTaskList() {
        guard let data = try? JSONEncoder().encode(taskList) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
    }
}

extension TaskDataProvider: TaskDataProviderProtocol {
    func getTaskList() -> [Task] {
        taskList
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskList.append(task)
        saveUpdatedTaskList()
        return taskList
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        let index = taskList.firstIndex(of: task) ?? 0
        taskList[index].isCompleted.toggle()
        saveUpdatedTaskList()
        return taskList
    }
    
    func deleteTask(task: Task) -> [Task] {
        let index = taskList.firstIndex(of: task) ?? 0
        taskList.remove(at: index)
        saveUpdatedTaskList()
        return taskList
    }
    
    func getCurrentSelecteDateTasks(of date: Date) -> [Task] {
        return getTaskList().filter {
            $0.date.toString("EEEE,dd.MM.yyyy") == date.toString("EEEE,dd.MM.yyyy")
        }.sorted { !$0.isCompleted && $1.isCompleted }
    }
}
