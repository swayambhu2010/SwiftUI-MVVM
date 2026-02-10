//
//  DateDataProvider.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

protocol DateDataProviderProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel]
}

class DateDataProvider {
    private func week(for date: Date, with index: Int) -> WeekModel {
        var results: [Date] = .init()
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))
        else { return .init(index: index, dates: [], referenceDate: date)}
        
        (0...6).forEach { day in
            if let weekday = Calendar.current.date(byAdding: .day, value: day, to: startOfWeek) {
                results.append(weekday)
            }
        }
        return .init(index: index, dates: results, referenceDate: date)
    }
}

extension DateDataProvider: DateDataProviderProtocol {
    func calculatePastFutureWeeks(_ date: Date) -> [WeekModel] {
        return [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1)
        ]
    }
}
