//
//  DateRepository.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol DateRepositoryProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel]
}

class DateRepository {
    private let dateProvider: DateDataProviderProtocol
    
    init(dateProvider: DateDataProviderProtocol) {
        self.dateProvider = dateProvider
    }
}

extension DateRepository: DateRepositoryProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel] {
        dateProvider.calculatePastFutureWeeks(date)
    }
}
