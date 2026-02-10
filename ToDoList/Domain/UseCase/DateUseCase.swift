//
//  DateUseCase.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol DateUseCaseProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel]
}

class DateUseCase {
    private let dateRepository: DateRepositoryProtocol
    
    init(dateRepository: DateRepositoryProtocol) {
        self.dateRepository = dateRepository
    }
}

extension DateUseCase: DateUseCaseProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel] {
        dateRepository.calculatePastFutureWeeks(date)
    }
}
