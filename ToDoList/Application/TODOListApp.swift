//
//  SwiftUI_MVVMApp.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

@main
struct TODOList: App {
    
    @StateObject var dateManager = DateManager()
    @StateObject var taskListManager = TaskListManager()
    
    var body: some Scene {
        WindowGroup {
            TaskHomePage().environmentObject(dateManager)
                         .environmentObject(taskListManager)
        }
    }
}
