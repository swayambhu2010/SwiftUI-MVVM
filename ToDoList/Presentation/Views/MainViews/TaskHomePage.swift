//
//  ContentView.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct TaskHomePage: View {
    
    @State private var createNewTask: Bool = false
    @StateObject private var viewModel: TaskPageViewModel
    
    init() {
        let dateUseCase = DateUseCase(
            dateRepository: DateRepository(
                dateProvider: DateDataProvider()
            )
        )
        
        let taskUseCase = TaskUseCase(
            taskRepository: TaskRepository(
                taskProvider: TaskDataProvider()
            )
        )
        
        _viewModel = StateObject(
            wrappedValue: TaskPageViewModel(
                dateUseCase: dateUseCase,
                taskUseCase: taskUseCase
            )
        )
    }
    
    var body: some View {
        VStack {
            DateHeader(viewModel: viewModel)
            ScrollView(.vertical) {
                VStack {
                    TaskListView(viewModel: viewModel)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        .overlay(alignment: .bottomTrailing) {
            Button {
                createNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .padding(26)
                    .background(.black)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .padding(.horizontal)
            }
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView() { task in
                viewModel.updateTaskList(task: task)
            }.presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    TaskHomePage()
}
