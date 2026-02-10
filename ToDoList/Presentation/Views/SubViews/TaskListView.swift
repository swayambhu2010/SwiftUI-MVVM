//
//  TaskListView.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import SwiftUI

struct TaskListView: View {
    @Binding var date: Date
    @Binding var items: [Task]
    var currentDateTaks: [Task] = []
    
    init(date: Binding<Date>, items: Binding<[Task]>) {
        // Need to check this what is this
        self._date = date
        self._items = items
        self.currentDateTaks = getCurrentDateTask()
    }
    
    var body: some View {
        VStack {
            ForEach(currentDateTaks) { task in
                TaskListItem(task: task)
                    .background(alignment: .leading) {
                        if currentDateTaks.last?.id != task.id {
                            Rectangle().frame(width: 1)
                                .offset(x: 12, y: 20)
                        }
                    }
            }
        }
        .padding(.top, 15)
    }
    
    func getCurrentDateTask() -> [Task] {
        return items.filter {
            $0.date.toString("EEEE,dd.MM.yyyy") == date.toString("EEEE,dd.MM.yyyy")
        }.sorted { !$0.isCompleted && $1.isCompleted }
    }
}

#Preview {
    ContentView().environmentObject(DateManager())
        .environmentObject(TaskListManager())
}
