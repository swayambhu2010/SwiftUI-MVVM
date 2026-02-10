//
//  TaskRepository.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelecteDateTasks(of date: Date) -> [Task]
}

class TaskRepository {
    private let taskProvider: TaskDataProviderProtocol
    
    init(taskProvider: TaskDataProviderProtocol) {
        self.taskProvider = taskProvider
    }
}

extension TaskRepository: TaskRepositoryProtocol {
    func getTaskList() -> [Task] {
        taskProvider.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskProvider.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskProvider.deleteTask(task: task)
    }
    
    func getCurrentSelecteDateTasks(of date: Date) -> [Task] {
        taskProvider.getCurrentSelecteDateTasks(of: date)
    }
}
