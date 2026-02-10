//
//  TaskUseCase.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol TaskUseCaseProtocol {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelecteDateTasks(of date: Date) -> [Task]
}

class TaskUseCase {
    private let taskRepository: TaskRepositoryProtocol
    
    init(taskRepository: TaskRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}

extension TaskUseCase: TaskUseCaseProtocol {
    func getTaskList() -> [Task] {
        taskRepository.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        taskRepository.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        taskRepository.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) -> [Task] {
        taskRepository.deleteTask(task: task)
    }
    
    func getCurrentSelecteDateTasks(of date: Date) -> [Task] {
        taskRepository.getCurrentSelecteDateTasks(of: date)
    }
}
