//
//  DateManager.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import Foundation
import Combine

class DateManager: ObservableObject {
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet {
            calcWeek(with: selectedDate)
        }
    }
    
    init(with date: Date = Date()) {
        self.selectedDate = Calendar.current.startOfDay(for: Date())
        calcWeek(with: selectedDate)
    }
    
    private func calcWeek(with date: Date) {
        weeks = [
            week(for: Calendar.current.date(byAdding: .day, value: -7, to: date)!, with: -1),
            week(for: date, with: 0),
            week(for: Calendar.current.date(byAdding: .day, value: 7, to: date)!, with: 1)
        ]
    }
    
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
    
    func selectToday() {
        select(date: Date())
    }
    
    func select(date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
    
    func update(to direction: SliderTimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
        case .unknown:
            selectedDate = selectedDate
        }
        calcWeek(with: selectedDate)
    }
}
