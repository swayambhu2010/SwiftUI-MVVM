//
//  TaskPageViewModel.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation
import Combine

enum SliderTimeDirection {
    case future
    case past
    case unknown
}

protocol TaskPageViewModelInputProtocol {
    func selectTheDay(with date: Date)
    func onDateScrolled(to direction: SliderTimeDirection)
    func updateTaskList(task: Task)
    func toggleTaskCompletion(task: Task)
    func deleteTaskList(task: Task)
}

protocol TaskPageViewModelOutputProtocol {
    func getSelectedDate() -> Date
    func getCurrentSelectedDataTask() -> [Task]
}

class TaskPageViewModel: ObservableObject, TaskPageViewModelInputProtocol, TaskPageViewModelOutputProtocol {
   
    private let dateUseCase: DateUseCaseProtocol
    private let taskUseCase: TaskUseCaseProtocol
    // Where is the subscriber??
    @Published var items: [Task] = []
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet {
            calcPastFutureWeeks(with: selectedDate)
        }
    }
    
    init(dateUseCase: DateUseCaseProtocol, taskUseCase: TaskUseCaseProtocol, with date: Date = Date()) {
        self.dateUseCase = dateUseCase
        self.taskUseCase = taskUseCase
        self.selectedDate = Calendar.current.startOfDay(for: date)
        // The above line should take care of this right?
        calcPastFutureWeeks(with: selectedDate)
        self.items = taskUseCase.getTaskList()
    }
    
    private func calcPastFutureWeeks(with date: Date) {
        weeks = dateUseCase.calculatePastFutureWeeks(date)
    }
}

extension TaskPageViewModel {
    func selectTheDay(with date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
    
    func onDateScrolled(to direction: SliderTimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
        case .unknown:
            selectedDate = selectedDate
        }
        calcPastFutureWeeks(with: selectedDate)
    }
    
    func updateTaskList(task: Task) {
        items = taskUseCase.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) {
        items = taskUseCase.toggleTaskCompletion(task: task)
    }
    
    func deleteTaskList(task: Task) {
        items = taskUseCase.deleteTask(task: task)
    }
}

extension TaskPageViewModel {
    func getSelectedDate() -> Date {
        selectedDate
    }
    
    func getCurrentSelectedDataTask() -> [Task] {
        taskUseCase.getCurrentSelecteDateTasks(of: selectedDate)
    }
}
