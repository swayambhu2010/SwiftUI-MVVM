//
//  TaskListView.swift
//  ToDoList
//
//  Created by Swayambhu BANERJEE on 10/02/26.
//

import SwiftUI

struct TaskListView: View {
   /* @Binding var date: Date
    @Binding var items: [Task]*/
    @ObservedObject var viewModel: TaskPageViewModel
    var currentDateTaks: [Task] = []
    
    /* init(date: Binding<Date>, items: Binding<[Task]>) {
         Need to check this what is this
        self._date = date
        self._items = items*/
   
    init(viewModel: TaskPageViewModel) {
        self.viewModel = viewModel
        self.currentDateTaks = viewModel.getCurrentSelectedDataTask()
    }
        
    var body: some View {
        VStack {
            ForEach(currentDateTaks) { task in
                TaskListItem(task: task,
                             onPress: { task in
                    toggleTaskCompletion(task: task)
                }, onLongPress: { task in
                    deleteTask(task: task)
                })
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
    
    func toggleTaskCompletion(task: Task) {
        viewModel.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        viewModel.deleteTaskList(task: task)
    }
}

#Preview {
    TaskHomePage()
}
