//
//  ContentView.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var createNewTask: Bool = false
    @EnvironmentObject var dateManager: DateManager
    @EnvironmentObject var taskListManager: TaskListManager
    
    var body: some View {
        VStack {
            DateHeader()
            ScrollView(.vertical) {
                VStack {
                    TaskListView(date: $dateManager.selectedDate, items: $taskListManager.items)
                }
            }
            .scrollIndicators(.hidden)
        }
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
            NewTaskView().presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    ContentView().environmentObject(DateManager())
        .environmentObject(TaskListManager())
}
