//
//  Task.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import Foundation

struct Task: Codable, Identifiable, Hashable {
    var id: UUID
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = .init(), title: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
