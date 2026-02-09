//
//  ContentView.swift
//  SwiftUI_MVVM
//
//  Created by Swayambhu BANERJEE on 05/02/26.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        ZStack {
            VStack {
                DateHeader()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(DateManager())
}
